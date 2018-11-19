!include "MUI.nsh"
!define MUI_COMPONENTSPAGE_SMALLDESC ;No value
!define MUI_UI "myUI.exe" ;Value
!define MUI_INSTFILESPAGE_COLORS "FFFFFF 000000" ;Two colors

#define installer name
OutFile "installer.exe"
 
# set desktop as install directory
InstallDir "$PROGRAMFILES32\Steam"
 
# default section start
Section "Installer Section"
 
# define output path
SetOutPath $INSTDIR
 
    CreateDirectory "$INSTDIR\steamapps\common\Deserts of Kharak\Data\originalManaged\"
    CopyFiles "$INSTDIR\steamapps\common\Deserts of Kharak\Data\Managed\*" "$INSTDIR\steamapps\common\Deserts of Kharak\Data\originalManaged"

    # define uninstaller name
    WriteUninstaller "$INSTDIR\steamapps\common\Deserts of Kharak\dok-mod-uninstaller.exe"

SectionEnd
# create a section to define what the uninstaller does.
# the section will always be named "Uninstall"
Section "Uninstall"
 
    # Always delete uninstaller first
    Delete "$INSTDIR\steamapps\common\Deserts of Kharak\dok-mod-uninstaller.exe"

    CopyFiles "$INSTDIR\steamapps\common\Deserts of Kharak\Data\originalManaged\*" "$INSTDIR\steamapps\common\Deserts of Kharak\Data\Managed\"

    # now delete installed file
    Delete "$INSTDIR\steamapps\common\Deserts of Kharak\Data\originalManaged"

SectionEnd