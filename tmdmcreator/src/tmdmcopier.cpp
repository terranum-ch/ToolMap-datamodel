/***************************************************************************
 tmdmcopier.cpp
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

#include "tmdmcopier.h"

TmDmCopier::TmDmCopier(const wxFileName & destfile) {
    m_File = new wxFFile();
    bool bOpen = m_File->Open(destfile.GetFullPath(), "a");
    wxASSERT(bOpen == true);
}



TmDmCopier::~TmDmCopier() {
    wxDELETE(m_File);
}



bool TmDmCopier::CopyFrom(const wxFileName & filename) {
    wxFFile mySrcFile;
    if (mySrcFile.Open(filename.GetFullPath()) == false) {
        m_Errors.Add(wxString::Format(_("Unable to open: %s"), filename.GetFullPath()));
        return false;
    }
    
    wxString mySrcTxt;
    if(mySrcFile.ReadAll(&mySrcTxt)==false){
        m_Errors.Add(wxString::Format(_("Reading from: %s failed!"), filename.GetFullPath()));
        return false;
    }
    return CopyFrom(mySrcTxt);
}



bool TmDmCopier::CopyFrom(const wxString & text) {
    if (m_File->Write(text) == false) {
        m_Errors.Add(wxString::Format(_("Writing to: %s failed!"), m_File->GetName()));
        return false;
    }
    
    return true;
}



wxArrayString TmDmCopier::GetErrors(){
    return m_Errors;
}