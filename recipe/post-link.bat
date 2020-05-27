REM On windows, create a symlink to the directory containing ngspice.dll,
REM so ngspice.dll appears in the place PySpice expects to find it.

set SPICE64_DLL_DIR=%PREFIX%\lib\site-packages\PySpice\Spice\NgSpice\Spice64_dll
md %SPICE64_DLL_DIR%
cd %SPICE64_DLL_DIR%
mklink /d dll-vs ..\..\..\..\..\..\bin
