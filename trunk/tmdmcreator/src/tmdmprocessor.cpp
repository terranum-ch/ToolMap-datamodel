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



bool TmDmProcessorSimple::ProcessBlock(int blockstart) {
    wxString mySQLCols = wxEmptyString;
    wxString mySQLTxt = wxEmptyString;
    
    wxFileInputStream input(m_FileSrc.GetFullPath());
    wxTextInputStream text(input);
    long myLineIndex = 0;
    while(input.IsOk() && !input.Eof() ){
        if (myLineIndex <= blockstart) {
            myLineIndex++;
            continue;
        }
        
        wxString myRow = text.ReadLine();
        
        // HERE !!! 
        
        
        
        myLineIndex++;
    }
    return wxNOT_FOUND;

    
    
    
    return false;
}









TmDmProcessorAttributs::TmDmProcessorAttributs(const wxFileName & src, const wxFileName & dest) : TmDmProcessor(src,dest) {
}

TmDmProcessorAttributs::~TmDmProcessorAttributs() {
}

bool TmDmProcessorAttributs::ProcessBlock(int blockstart) {
    return false;
}

