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

TmDmProcessor::TmDmProcessor() {
}

TmDmProcessor::~TmDmProcessor() {
}

int TmDmProcessor::FindBlock(const wxString & blockname) {
}

TmDmProcessorSimple::TmDmProcessorSimple() {
}

TmDmProcessorSimple::~TmDmProcessorSimple() {
}

bool TmDmProcessorSimple::ProcessBlock(int blockstart, TmDmCopier * copier) {
}

TmDmProcessorAttributs::TmDmProcessorAttributs() {
}

TmDmProcessorAttributs::~TmDmProcessorAttributs() {
}

bool TmDmProcessorAttributs::ProcessBlock(int blockstart, TmDmCopier * copier) {
}

