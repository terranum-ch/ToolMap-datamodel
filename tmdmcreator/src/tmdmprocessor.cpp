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








TmDmProcessorSimple::TmDmProcessorSimple(const wxFileName & src, const wxFileName & dest) : TmDmProcessor(src,dest) {
}



TmDmProcessorSimple::~TmDmProcessorSimple() {
}



bool TmDmProcessorSimple::ProcessBlock(int blockstart, const wxString & tablename) {
    wxArrayString mySQLCols;
    TmDmCopier myCopier(m_FileDst);
    
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
            myInsert.Append(wxString::Format(_T("\"%s\","), myValues.Item(i)));
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

bool TmDmProcessorAttributs::ProcessBlock(int blockstart, const wxString & tablename) {
    return false;
}

