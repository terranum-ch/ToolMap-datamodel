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

tmdmcreator::tmdmcreator() {
}



tmdmcreator::~tmdmcreator() {
}



void tmdmcreator::SetBaseSQL(wxFileName value) {
  m_FileNameBaseSQL = value;
}



void tmdmcreator::SetUserSQL(wxFileName value) {
  m_FileNameUserSQL = value;
}



void tmdmcreator::SetUserContent(wxFileName value) {
  m_FileNameUserContent = value;
}



void tmdmcreator::SetOutSQL(wxFileName value) {
  m_FileNameOutSQL = value;
}



bool tmdmcreator::CheckFiles(wxArrayString & errormsg) {
    return false;
}



bool tmdmcreator::ProcessFiles(wxArrayString & errorsmsg) {
    return false;
}

