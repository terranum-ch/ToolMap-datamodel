/***************************************************************************
 tmdmcreator.cpp
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

#include "tmdmcreator.h"
#include "tmdmcopier.h"
#include "tmdmprocessor.h"

TmDmCreator::TmDmCreator() {
}



TmDmCreator::~TmDmCreator() {
}



void TmDmCreator::SetBaseSQL(wxFileName value) {
  m_FileNameBaseSQL = value;
}



void TmDmCreator::SetUserSQL(wxFileName value) {
  m_FileNameUserSQL = value;
}



void TmDmCreator::SetUserContent(wxFileName value) {
  m_FileNameUserContent = value;
}



void TmDmCreator::SetOutSQL(wxFileName value) {
  m_FileNameOutSQL = value;
}


bool TmDmCreator::_CheckExistsAndExt(const wxFileName & filename, const wxString & extension, wxArrayString * errormsg){
    wxASSERT(errormsg);
    if (filename.Exists() == false) {
        errormsg->Add(wxString::Format(_("File: %s didn't exists!"), filename.GetFullPath()));
        return false;
    }
    if (filename.GetExt().Lower() != extension) {
        errormsg->Add(wxString::Format(_("Wrong extension for: %s  (expected: %s)"), filename.GetFullPath(), extension));
        return false;
    }
    return true;
}



bool TmDmCreator::CheckFiles(wxArrayString & errormsg) {
    errormsg.Clear();
    if (_CheckExistsAndExt(m_FileNameBaseSQL, _T("sql"), &errormsg) == false) {
        return false;
    }
    if (_CheckExistsAndExt(m_FileNameUserSQL, _T("sql"), &errormsg) == false) {
        return false;
    }
    if (_CheckExistsAndExt(m_FileNameUserContent, _T("txt"), &errormsg) == false) {
        return false;
    }
    if (m_FileNameOutSQL.Exists()) {
        errormsg.Add(wxString::Format(_("output file: %s allready exists!"), m_FileNameOutSQL.GetFullPath()));
        return false;
    }
    if (m_FileNameOutSQL.IsDirWritable() == false){
        errormsg.Add(wxString::Format(_T("Writing not permitted into %s"), m_FileNameOutSQL.GetPath()));
        return false;
    }
    return true;
}



bool TmDmCreator::ProcessFiles(wxArrayString & errorsmsg) {
    errorsmsg.Clear();
    // Copy structure
    { // needed to destroy the copier before processing layers
        TmDmCopier myCopier(m_FileNameOutSQL);
        if (myCopier.CopyFrom(m_FileNameBaseSQL) == false) {
            errorsmsg.Add(wxString::Format(_("Copying: %s failed!"), m_FileNameBaseSQL.GetFullPath()));
            return false;
        }
        
        if (myCopier.CopyFrom(m_FileNameUserSQL) == false) {
            errorsmsg.Add(wxString::Format(_("Copying: %s failed!"), m_FileNameUserSQL.GetFullPath()));
            return false;
        }
    }

    // Process layers
    TmDmProcessorSimple myProc(m_FileNameUserContent, m_FileNameOutSQL);
    int myThematicLayersStart = myProc.FindBlock(_T("thematic_layers"));
    if (myThematicLayersStart == wxNOT_FOUND) {
        errorsmsg.Add(wxString::Format(_("'thematic_layers' field not found in %s"), m_FileNameUserContent.GetFullPath()));
        return false;
    }
    if (myProc.ProcessBlock(myThematicLayersStart, _T("thematic_layers"))==false) {
        errorsmsg.Add(wxString::Format(_("Processing 'thematic_layers' failed in %s"), m_FileNameUserContent.GetFullPath()));
        return false;
    }
    
    // Process objects
    int myObjectStart = myProc.FindBlock(_T("dmn_layer_object"));
    if (myObjectStart == wxNOT_FOUND) {
        errorsmsg.Add(wxString::Format(_("'dmn_layer_object' field not found in %s"), m_FileNameUserContent.GetFullPath()));
        return false;
    }
    if (myProc.ProcessBlock(myObjectStart, _T("dmn_layer_object"))==false) {
        errorsmsg.Add(wxString::Format(_("Processing 'dmn_layer_object' failed in %s"), m_FileNameUserContent.GetFullPath()));
        return false;
    }
    
    // Process attributs
    TmDmProcessorAttributs myProcAttributs (m_FileNameUserContent, m_FileNameOutSQL);
    int myAttributStart = myProcAttributs.FindBlock(_T("attributs"));
    if (myAttributStart == wxNOT_FOUND) {
        errorsmsg.Add(wxString::Format(_("'attributs' field not found in %s"), m_FileNameUserContent.GetFullPath()));
        return false;
    }
    if (myProcAttributs.ProcessBlock(myAttributStart, wxEmptyString)==false) {
        errorsmsg.Add(wxString::Format(_("Processing 'attributs' failed in %s"), m_FileNameUserContent.GetFullPath()));
        return false;
    }
    
    
    return true;
}

