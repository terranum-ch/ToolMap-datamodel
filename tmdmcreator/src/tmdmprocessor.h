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

// For compilers that support precompilation, includes "wx/wx.h".
#include "wx/wxprec.h"

// Include wxWidgets' headers
#ifndef WX_PRECOMP
#include <wx/wx.h>
#endif

class TmDmCopier;
class TmDmProcessor {
protected:
    TmDmCopier * m_Copier;
    
public:
    TmDmProcessor();
    virtual ~TmDmProcessor();
    
    int FindBlock(const wxString & blockname);
    virtual bool ProcessBlock(int blockstart, TmDmCopier * copier) = 0;
};







class TmDmProcessorSimple : public TmDmProcessor {
public:
    TmDmProcessorSimple();
    virtual ~TmDmProcessorSimple();
    
    virtual bool ProcessBlock(int blockstart, TmDmCopier * copier);
};







class TmDmProcessorAttributs : public TmDmProcessor {
public:
    TmDmProcessorAttributs();
    virtual ~TmDmProcessorAttributs();
    
    virtual bool ProcessBlock(int blockstart, TmDmCopier * copier);
};
#endif
