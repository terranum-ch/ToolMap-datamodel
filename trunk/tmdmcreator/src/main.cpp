/***************************************************************************
 TmDmCreator
 Create SQL code for ToolMap project
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
#include "wx/wxprec.h"
#ifdef __BORLANDC__
#pragma hdrstop
#endif
#ifndef WX_PRECOMP
#include "wx/wx.h"
#endif

#include <wx/app.h>
#include <wx/cmdline.h>
#include <wx/dir.h>
#include <wx/filename.h>
#include "tmdmcreator.h"


static const wxCmdLineEntryDesc cmdLineDesc[] =
{
    { wxCMD_LINE_SWITCH, "h", "help", "show this help message",
        wxCMD_LINE_VAL_NONE, wxCMD_LINE_OPTION_HELP },
    { wxCMD_LINE_SWITCH, "v", "verbose", "Be more verbose" },
    { wxCMD_LINE_SWITCH, "t", "toolmap", "toolmap output" },
    { wxCMD_LINE_SWITCH, "o", "overwrite", "overwrite output" },    
    { wxCMD_LINE_PARAM, NULL, NULL, "[base structure sql file]"},
    { wxCMD_LINE_PARAM, NULL, NULL, "[user structure sql file]"},
    { wxCMD_LINE_PARAM, NULL, NULL, "[user content txt file]"},
    { wxCMD_LINE_PARAM, NULL, NULL, "[result file]"},
    { wxCMD_LINE_NONE }
};



void PrintArray(const wxArrayString & array, const wxString & msg = wxEmptyString){
    if (msg != wxEmptyString) {
        wxPrintf(msg + _T("\n"));
    }
    for (unsigned int i = 0; i< array.GetCount(); i++) {
        wxPrintf(array[i] + _T("\n"));
    }
}



int main(int argc, char **argv){
    // debugging string for OSX
    // this is needed for viewing string content with Xcode !!
    wxString myTest = _T("Test debugging");
    myTest.ToUTF8().data();
    myTest.Len();
    
    wxApp::CheckBuildOptions(WX_BUILD_OPTIONS_SIGNATURE, "program");
    wxInitializer initializer;
    if ( !initializer ){
        fprintf(stderr, "Failed to initialize the wxWidgets library, aborting.");
        return -1;
    }
    
    wxString myLogoTxt = _T("*\n* TmDmCreator \n* Create SQL file for ToolMap projects \n* (c) Copyright 2013 Lucien Schreiber - CREALP . All Rights Reserved. \n*\n");
    wxCmdLineParser parser(cmdLineDesc, argc, argv);
    parser.SetLogo(myLogoTxt);
    if (parser.Parse() != 0) {
        return 0;
    }
    
    // cmd line is correct !!
    wxPrintf(myLogoTxt);
    
    bool bVerbose = parser.Found("verbose");
    bool bToolMap = parser.Found("toolmap");
    if (parser.Found("overwrite")) {
        wxRemoveFile(parser.GetParam(3));
    }
    
    if (bToolMap == true) {
        wxPrintf(_("Exporting to ToolMap project not supported for now!\n"));
        return 0;
    }
    
    wxASSERT(parser.GetParamCount() == 4);
    TmDmCreator myCreator;
    myCreator.SetBaseSQL(wxFileName(parser.GetParam(0)));
    myCreator.SetUserSQL(wxFileName(parser.GetParam(1)));
    myCreator.SetUserContent(wxFileName(parser.GetParam(2)));
    myCreator.SetOutSQL(wxFileName(parser.GetParam(3)));
    
    wxArrayString myErrors;
    if (myCreator.CheckFiles(myErrors) == false) {
        if (bVerbose == true) {
            PrintArray(myErrors);
        }
        wxPrintf(_("Error while checking files, aborting!\n"));
        return 0;
    }
    
    if (myCreator.ProcessFiles(myErrors) == false) {
        if (bVerbose == true) {
            PrintArray(myErrors);
        }
        wxPrintf(_("Error processing files, aborting\n"));
        return 0;
    }
    
    wxPrintf(_("Processing succeed!\n"));
    return 0;
}
