
!include "MUI.nsh"
!include 'LogicLib.nsh'

Name "Desert of Kharak Mods"

  !insertmacro MUI_PAGE_WELCOME
  ;!insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH
  
  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_CONFIRM
  ;!insertmacro MUI_UNPAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
  !insertmacro MUI_UNPAGE_COMPONENTS
  !insertmacro MUI_UNPAGE_DIRECTORY
  !insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_UNPAGE_FINISH

  !insertmacro MUI_LANGUAGE "English" ; The first language is the default language


#define installer name
OutFile "installer.exe"
 
# set desktop as install directory
InstallDir "$PROGRAMFILES32\Steam\"
 
# default section start
Section "Backup Managed"

    # define output path
    SetOutPath $INSTDIR
 
    ${If} ${FileExists} '$INSTDIR\steamapps\common\Deserts of Kharak\*.*'

        CreateDirectory "$INSTDIR\steamapps\common\Deserts of Kharak\Data\originalManaged\"
        CopyFiles "$INSTDIR\steamapps\common\Deserts of Kharak\Data\Managed\*" "$INSTDIR\steamapps\common\Deserts of Kharak\Data\originalManaged"

    ${Else}
        MessageBox MB_ICONEXCLAMATION "Did not find Deserts of Kharak folders $INSTDIR"
    ${EndIf}

SectionEnd

Section "Install Map Mod "

    # define output path
    SetOutPath $INSTDIR
    
    ${If} ${FileExists} '$INSTDIR\steamapps\common\Deserts of Kharak\*.*'
        file /r "map-mod\steamapps"
    ${Else}
        MessageBox MB_ICONEXCLAMATION "Did not find Deserts of Kharak folders"
    ${EndIf}

SectionEnd

Section "Install Balance mod"

    # define output path
    SetOutPath $INSTDIR
    
    ${If} ${FileExists} '$INSTDIR\steamapps\common\Deserts of Kharak\*.*'
        file /r "balance-mod\steamapps"
    ${Else}
        MessageBox MB_ICONEXCLAMATION "Did not find Deserts of Kharak folders"
    ${EndIf}

SectionEnd

Section 'Create Unistaller'

    # define output path
    SetOutPath $INSTDIR

    # define uninstaller name
    WriteUninstaller "$INSTDIR\steamapps\common\Deserts of Kharak\dok-mod-uninstaller.exe"

SectionEnd


# create a section to define what the uninstaller does.
# the section will always be named "Uninstall"
Section "Uninstall"
 
    # Always delete uninstaller first
    Delete "$INSTDIR\dok-mod-uninstaller.exe"

    CopyFiles "$INSTDIR\Data\originalManaged\*" "$INSTDIR\Data\Managed\"

    # now delete installed file
    Delete "$INSTDIR\steamapps\common\Deserts of Kharak\Data\originalManaged"

SectionEnd