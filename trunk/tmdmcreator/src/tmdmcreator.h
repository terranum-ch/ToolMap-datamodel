/***************************************************************************
 tmdmcreator.h
 -------------------
 copyright            : (C) 2012 CREALP Lucien Schreiber
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
#ifndef _TMDMCREATOR_H_
#define _TMDMCREATOR_H_

#include "wx/wxprec.h"
#ifndef WX_PRECOMP
#include <wx/wx.h>
#endif
#include <wx/filename.h>

class TmDmCreator {
private:
    wxFileName m_FileNameBaseSQL;
    wxFileName m_FileNameUserSQL;
    wxFileName m_FileNameUserContent;
    wxFileName m_FileNameOutSQL;
    
    bool _CheckExistsAndExt(const wxFileName & filename, const wxString & extension, wxArrayString * errormsg);
    
public:
    TmDmCreator();
    virtual ~TmDmCreator();
    
    void SetBaseSQL(wxFileName value);
    void SetUserSQL(wxFileName value);
    void SetUserContent(wxFileName value);
    void SetOutSQL(wxFileName value);
    
    bool CheckFiles(wxArrayString & errormsg);
    bool ProcessFiles(wxArrayString & errorsmsg);    
};
#endif
