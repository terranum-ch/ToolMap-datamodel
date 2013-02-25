/***************************************************************************
 tmdmprocessor.cpp
 -------------------
 copyright            : (C) 2013 CREALP Lucien Schreiber
 email                : lucien.schreiber at crealp dot vs dot ch
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#include "tmdmprocessor.h"
#include "tmdmcopier.h"

TmDmProcessor::TmDmProcessor(const wxFileName & src, const wxFileName & dest) {
    m_FileSrc = src;
    m_FileDst = dest;
    m_LanguageCol = 0;
}



TmDmProcessor::~TmDmProcessor() {
}



int TmDmProcessor::FindBlock(const wxString & blockname) {
    wxFileInputStream input(m_FileSrc.GetFullPath());
    wxTextInputStream text(input);
    long myLineIndex = 0;
    while(input.IsOk() && !input.Eof() ){
        wxString myLine = text.ReadLine();
        if (myLine.StartsWith(blockname)==true){
            return myLineIndex;
        }
        myLineIndex++;
    }
    return wxNOT_FOUND;
}



wxString TmDmProcessor::SwitchCols(wxArrayString * cols, wxArrayString * values, int item) {
    if (m_LanguageCol == 0) {
        return values->Item(item);
    }
    

    if(cols->Item(item).Contains(_T("_0")) == true) {
        return values->Item(item + m_LanguageCol);
    }
    
    wxString myColName = wxString::Format(_T("_%d"), m_LanguageCol);
    if (cols->Item(item).Contains(myColName) == true) {
        return values->Item(item - m_LanguageCol);
    }
    return values->Item(item);
}



void TmDmProcessor::SetLanguageColumn(int value) {
    m_LanguageCol = value;
}








TmDmProcessorSimple::TmDmProcessorSimple(const wxFileName & src, const wxFileName & dest) : TmDmProcessor(src,dest) {
}



TmDmProcessorSimple::~TmDmProcessorSimple() {
}



bool TmDmProcessorSimple::ProcessBlock(int blockstart, const wxString & tablename) {
    wxArrayString mySQLCols;
    TmDmCopier myCopier(m_FileDst);
    myCopier.CopyFrom(wxString::Format(_T("\n-- %s --\n"), tablename));

    
    wxFileInputStream input(m_FileSrc.GetFullPath());
    wxTextInputStream text(input);
    long myLineIndex = 0;
    while(input.IsOk() && !input.Eof() ){
        wxString myRow = text.ReadLine();
        if (myLineIndex <= blockstart) {
            myLineIndex++;
            continue;
        }
        
        if (myLineIndex == blockstart+1) {
            mySQLCols = wxStringTokenize(myRow, _T("\t"), wxTOKEN_RET_EMPTY);
            myLineIndex++;
            continue;
        }
        
        wxArrayString myValues = wxStringTokenize(myRow, _T("\t"), wxTOKEN_RET_EMPTY_ALL);
        bool bEmpty = true;
        for (unsigned int i = 0; i< myValues.GetCount(); i++) {
            if (myValues[i] != wxEmptyString) {
                bEmpty = false;
                break;
            }
        }
        if (bEmpty == true) {
            // ok empty line found
            return true;
        }
        
        // write insert sentence
        wxString myInsert = wxString::Format(_T("INSERT INTO `%s` ("), tablename);
        for (unsigned int i = 0; i< mySQLCols.GetCount(); i++) {
            myInsert.Append(wxString::Format(_T("%s,"), mySQLCols.Item(i)));
        }
        myInsert.RemoveLast();
        myInsert.Append(_T(") VALUES ("));
        for (unsigned int i = 0; i< mySQLCols.GetCount(); i++) {
            myInsert.Append(wxString::Format(_T("\"%s\","), SwitchCols(&mySQLCols, &myValues, i)));
        }
        myInsert.RemoveLast();
        myInsert.Append(_T(");\n"));
        myCopier.CopyFrom(myInsert);
        myLineIndex++;
    }
    return false;
}









TmDmProcessorAttributs::TmDmProcessorAttributs(const wxFileName & src, const wxFileName & dest) : TmDmProcessor(src,dest) {
}



TmDmProcessorAttributs::~TmDmProcessorAttributs() {
}



bool TmDmProcessorAttributs::_ProcessAttributesName(int blockstart) {
    wxArrayString mySQLCols;
    TmDmCopier myCopier(m_FileDst);
    myCopier.CopyFrom(wxString::Format(_T("\n-- %s --\n"), _T("dmn_layer_attribut")));
    int NUM_COLS = 3;
    wxArrayString myPreviousRow;
    
    wxFileInputStream input(m_FileSrc.GetFullPath());
    wxTextInputStream text(input);
    long myLineIndex = 0;
    while(input.IsOk() && !input.Eof() ){
        wxString myRow = text.ReadLine();
        if (myLineIndex <= blockstart) {
            myLineIndex++;
            continue;
        }
        
        if (myLineIndex == blockstart+1) {
            mySQLCols = wxStringTokenize(myRow, _T("\t"), wxTOKEN_RET_EMPTY);
            myLineIndex++;
            continue;
        }
        
        wxArrayString myValues = wxStringTokenize(myRow, _T("\t"), wxTOKEN_RET_EMPTY_ALL);
        bool bEmpty = true;
        for (unsigned int i = 0; i< myValues.GetCount(); i++) {
            if (myValues[i] != wxEmptyString) {
                bEmpty = false;
                break;
            }
        }
        if (bEmpty == true) {
            // ok empty line found
            return true;
        }
        
        // check that this row differs from previous
        wxArrayString myAttributRow;
        for (unsigned int i = 0; i< NUM_COLS; i++) {
            myAttributRow.Add(myValues.Item(i));
        }
        if (myAttributRow == myPreviousRow) {
            continue;
        }
        myPreviousRow = myAttributRow;
        
        
        wxString myInsert = _T("INSERT INTO `dmn_layer_attribut` VALUES (");
        for (unsigned int i = 0; i< myAttributRow.GetCount(); i++) {
            myInsert.Append(wxString::Format(_T("\"%s\","), myAttributRow.Item(i)));
        }
        myInsert.RemoveLast();
        myInsert.Append(_T(");\n"));
        myCopier.CopyFrom(myInsert);
        myLineIndex++;
    }
    return true;
}



bool TmDmProcessorAttributs::_ProcessAttributesValues(int blockstart) {
    wxArrayString mySQLCols;
    TmDmCopier myCopier(m_FileDst);
    myCopier.CopyFrom(wxString::Format(_T("\n-- %s --\n"), _T("attribut values")));
    int START_COL = 3;
    
    wxFileInputStream input(m_FileSrc.GetFullPath());
    wxTextInputStream text(input);
    long myLineIndex = 0;
    while(input.IsOk() && !input.Eof() ){
        wxString myRow = text.ReadLine();
        if (myLineIndex <= blockstart) {
            myLineIndex++;
            continue;
        }
        
        if (myLineIndex == blockstart+1) {
            mySQLCols = wxStringTokenize(myRow, _T("\t"), wxTOKEN_RET_EMPTY);
            myLineIndex++;
            continue;
        }
        
        
        wxArrayString myValues = wxStringTokenize(myRow, _T("\t"), wxTOKEN_RET_EMPTY_ALL);
        bool bEmpty = true;
        for (unsigned int i = 0; i< myValues.GetCount(); i++) {
            if (myValues[i] != wxEmptyString) {
                bEmpty = false;
                break;
            }
        }
        if (bEmpty == true) {
            // ok empty line found
            return true;
        }
        
        // query to dmn_catalog
        wxString myInsert = _T("INSERT INTO `dmn_catalog` VALUES (");
        for (unsigned int i = START_COL; i< mySQLCols.GetCount(); i++) {
            myInsert.Append(wxString::Format(_T("\"%s\","), SwitchCols(&mySQLCols, &myValues, i)));
        }
        myInsert.RemoveLast();
        myInsert.Append(_T(");\n"));
        
        
        // query to dmn_attribut_value
        myInsert.Append(wxString::Format(_T("INSERT INTO `dmn_attribut_value` VALUES (%s, %s);\n"),
                                         myValues.Item(0), myValues.Item(START_COL)));
        
        myCopier.CopyFrom(myInsert);
        myLineIndex++;
    }
    return true;
}



bool TmDmProcessorAttributs::ProcessBlock(int blockstart, const wxString & tablename) {
    if (_ProcessAttributesName(blockstart) == false) {
        return false;
    }
    
    if (_ProcessAttributesValues(blockstart) == false) {
        return false;
    }
    return true;
}



