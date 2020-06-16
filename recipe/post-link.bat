REM On windows, create a symlink to the directory containing ngspice.dll,
REM so ngspice.dll appears in the place PySpice expects to find it.

REM C:\Users\...\miniconda3\Scripts   aka bin
REM C:\Users\...\miniconda3\pkgs\ngspice-lib-32-h8c06526_6
REM   bin
REM   info
REM   lib
REM   share

REM C:\Users\...\miniconda3\bin\ngspice.dll
REM C:\Users\...\miniconda3\share\ngspice\scripts\spinit
REM    codemodel ../lib/ngspice/spice2poly.cm
REM C:\Users\...\miniconda3\Lib\ngspice\spice2poly.cm

REM C:\Users\...\miniconda3\conda-bld\pyspice_1592343686090\_test_env\lib\site-packages\PySpice

set SPICE64_DLL_DIR=%PREFIX%\lib\site-packages\PySpice\Spice\NgSpice\Spice64_dll
md %SPICE64_DLL_DIR%
cd %SPICE64_DLL_DIR%
REM Due to UAC, Administrator cannot create link
REM mklink /d dll-vs ..\..\..\..\..\..\bin
xcopy ..\..\..\..\..\..\bin .\dll-vs\
md .\share\ngspice
xcopy /s ..\..\..\..\..\..\share\ngspice .\share\ngspice\
md .\share\lib\ngspice
xcopy /s ..\..\..\..\..\..\lib\ngspice .\share\lib\ngspice\
