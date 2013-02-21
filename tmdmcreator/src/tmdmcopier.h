/***************************************************************************
 tmdmcopier.h
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
#ifndef _TMDMCOPIER_H_
#define _TMDMCOPIER_H_

#include "wx/wxprec.h"
#ifndef WX_PRECOMP
#include <wx/wx.h>
#endif

#include <wx/filename.h>
#include <wx/ffile.h>



class TmDmCopier {
private:
    wxFFile * m_File;
    wxArrayString m_Errors;
    
public:
    TmDmCopier(const wxFileName & destfile);
    virtual ~TmDmCopier();
    
    bool CopyFrom(const wxFileName & filename);
    bool CopyFrom(const wxString & text);
    
    wxArrayString GetErrors();
};
#endif
