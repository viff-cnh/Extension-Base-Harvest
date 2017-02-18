#define PackageName      "Base Harvest"
#define PackageNameLong  "Base Harvest Extension"
#define Version          "3.0"
#define ReleaseType      "official"

#define CoreVersion      "6.0"
#define CoreReleaseAbbr  ""

#include "package (Setup section) v6.0.iss"
#define ExtDir "C:\Program Files\LANDIS-II\v6\bin\extensions"
#define AppDir "C:\Program Files\LANDIS-II\v6\"
#define LandisPlugInDir "C:\Program Files\LANDIS-II\plug-ins"
#define LandisExtInfo "C:\Program Files\LANDIS-II\v6\ext-info"

[Files]
; The extension is this .dll (ie, the extension's assembly)
; NB: Do not put a version number in the file name of this .dll in the VS (build) .csproj file
Source: ..\src\bin\Debug\Landis.Extension.BaseHarvest.dll; DestDir: {#ExtDir}; Flags: replacesameversion 

; Requisite auxiliary libraries
; NB. These libraries are used by other extensions and thus are never uninstalled.
Source: ..\src\bin\Debug\Landis.Library.HarvestManagement-v2.dll; DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\src\bin\Debug\Landis.Library.SiteHarvest-v1.dll;       DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\src\bin\Debug\Landis.Library.Metadata.dll;       DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall

;User Guides are no longer shipped with installer
;Source: ..\documentation\LANDIS-II Base Harvest v3.0 User Guide.pdf; DestDir: {#AppDir}\docs

;Complete example for testing
Source: ..\deploy\example\*.txt; DestDir: {#AppDir}\examples\Base Harvest
Source: ..\deploy\example\ecoregions.gis; DestDir: {#AppDir}\examples\Base Harvest
Source: ..\deploy\example\initial-communities.gis; DestDir: {#AppDir}\examples\Base Harvest
Source: ..\deploy\example\*.bat; DestDir: {#AppDir}\examples\Base Harvest

;LANDISII identifies the extension with the info this .txt file
; New releases must modify the name of this file and the info in it
#define InfoTxt "Base Harvest v3.0.txt"
Source: {#InfoTxt}; DestDir: {#LandisPlugInDir}
Source: {#InfoTxt}; DestDir: {#LandisExtInfo}

[Run]
;; Run plug-in admin tool to add the entry for the plug-in
#define PlugInAdminTool  CoreBinDir + "\Landis.PlugIns.Admin.exe"

Filename: {#PlugInAdminTool}; Parameters: "remove ""Base Harvest"" "; WorkingDir: {#LandisPlugInDir}
Filename: {#PlugInAdminTool}; Parameters: "add ""{#InfoTxt}"" "; WorkingDir: {#LandisPlugInDir}

[Code]
{ Check for other prerequisites during the setup initialization }
#include "package (Code section) v3.iss"

//-----------------------------------------------------------------------------

function InitializeSetup_FirstPhase(): Boolean;
begin
  Result := True
end;
