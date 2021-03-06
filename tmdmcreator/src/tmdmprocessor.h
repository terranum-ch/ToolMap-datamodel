/***************************************************************************
 tmdmprocessor.h
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
#ifndef _TMDMPROCESSOR_H_
#define _TMDMPROCESSOR_H_

#include "wx/wxprec.h"
#ifndef WX_PRECOMP
#include <wx/wx.h>
#endif
#include <wx/filename.h>
#include <wx/wfstream.h>
#include <wx/txtstrm.h>
#include <wx/tokenzr.h>


class TmDmCopier;
class TmDmProcessor {
protected:
    wxFileName m_FileSrc;
    wxFileName m_FileDst;
    
    int m_LanguageCol;
    wxString SwitchCols(wxArrayString * cols, wxArrayString * values, int item);
    
public:
    TmDmProcessor(const wxFileName & src, const wxFileName & dest);
    virtual ~TmDmProcessor();
    
    int FindBlock(const wxString & blockname);
    virtual bool ProcessBlock(int blockstart, const wxString & tablename) = 0;

    void SetLanguageColumn(int value);
};







class TmDmProcessorSimple : public TmDmProcessor {
public:
    TmDmProcessorSimple(const wxFileName & src, const wxFileName & dest);
    virtual ~TmDmProcessorSimple();
    
    virtual bool ProcessBlock(int blockstart, const wxString & tablename);
};







class TmDmProcessorAttributs : public TmDmProcessor {
private:
    bool _ProcessAttributesName(int blockstart);
    bool _ProcessAttributesValues(int blockstart);
    
public:
    TmDmProcessorAttributs(const wxFileName & src, const wxFileName & dest);
    virtual ~TmDmProcessorAttributs();
    
    virtual bool ProcessBlock(int blockstart, const wxString & tablename);
};
#endif
