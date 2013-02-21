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
}

TmDmCopier::~TmDmCopier() {
}

void TmDmCopier::SetCopyMode(TMDMCOPIER_MODE value) {
  m_CopyMode = value;
}

bool TmDmCopier::CopyFrom(const wxFileName & filename) {
}

bool TmDmCopier::CopyFrom(const wxString & text) {
}

bool TmDmCopier::IsCopyAllowed() {
}

