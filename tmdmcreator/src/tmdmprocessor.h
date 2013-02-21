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


class TmDmCopier;
class TmDmProcessor {
protected:
    wxFileName m_FileSrc;
    wxFileName m_FileDst;
    
public:
    TmDmProcessor(const wxFileName & src, const wxFileName & dest);
    virtual ~TmDmProcessor();
    
    int FindBlock(const wxString & blockname);
    virtual bool ProcessBlock(int blockstart) = 0;
};







class TmDmProcessorSimple : public TmDmProcessor {
public:
    TmDmProcessorSimple(const wxFileName & src, const wxFileName & dest);
    virtual ~TmDmProcessorSimple();
    
    virtual bool ProcessBlock(int blockstart);
};







class TmDmProcessorAttributs : public TmDmProcessor {
public:
    TmDmProcessorAttributs(const wxFileName & src, const wxFileName & dest);
    virtual ~TmDmProcessorAttributs();
    
    virtual bool ProcessBlock(int blockstart);
};
#endif
