REM ================================================================================
REM                       FOLLOWING IS A HACK TO BE FIXED
REM
REM Ngspice Windows build works fine, because paths are relative to the executable
REM But for the DLL, the build is wrong, spinit content must be fixed
REM   Files are installed in a Unix like file hierarchy
REM NOTICE: conda build is a pain, very slow,
REM         a fix requires Windows compilation etc. skills
REM ================================================================================

REM ================================================================================
REM                         Conda File Hierarchy
REM
REM C:\Users\...\miniconda3\bin\ngspice.dll
REM C:\Users\...\miniconda3\share\ngspice\scripts\spinit
REM    codemodel ../lib/ngspice/spice2poly.cm
REM C:\Users\...\miniconda3\Lib\ngspice\spice2poly.cm
REM
REM C:\Users\...\miniconda3\Scripts   aka bin
REM
REM C:\Users\...\miniconda3\pkgs\ngspice-lib-32-h8c06526_6
REM   bin
REM   info
REM   lib
REM   share
REM
REM conda build tmp env:
REM   C:\Users\...\miniconda3\conda-bld\pyspice_1592343686090\_test_env\lib\site-packages\PySpice
REM ================================================================================

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
