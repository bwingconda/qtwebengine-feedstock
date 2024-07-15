@REM https://bugreports.qt.io/browse/QTBUG-107009
set "PATH=%SRC_DIR%\build\lib\qt6\bin;%PATH%"

cmake -S"%SRC_DIR%/%PKG_NAME%" -B"%SRC_DIR%\build" -GNinja ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DINSTALL_BINDIR=lib/qt6/bin ^
    -DINSTALL_PUBLICBINDIR=bin ^
    -DINSTALL_LIBEXECDIR=lib/qt6 ^
    -DINSTALL_DOCDIR=share/doc/qt6 ^
    -DINSTALL_ARCHDATADIR=lib/qt6 ^
    -DINSTALL_DATADIR=share/qt6 ^
    -DINSTALL_INCLUDEDIR=include/qt6 ^
    -DINSTALL_MKSPECSDIR=lib/qt6/mkspecs ^
    -DINSTALL_EXAMPLESDIR=share/doc/qt6/examples ^
    -DINSTALL_DATADIR=share/qt6
if errorlevel 1 exit 1

cmake --build build --target install
if errorlevel 1 exit 1

xcopy /y /s %LIBRARY_PREFIX%\lib\qt6\bin\*.dll %LIBRARY_PREFIX%\bin
if errorlevel 1 exit 1

@REM copy %LIBRARY_PREFIX%\lib\qt6\bin\Linguist.exe %LIBRARY_PREFIX%\bin\Linguist6.exe
@REM if errorlevel 1 exit 1
@REM copy %LIBRARY_PREFIX%\lib\qt6\bin\Designer.exe %LIBRARY_PREFIX%\bin\Designer6.exe
@REM if errorlevel 1 exit 1
@REM copy %LIBRARY_PREFIX%\lib\qt6\bin\pixeltool.exe %LIBRARY_PREFIX%\bin\pixeltool6.exe
@REM if errorlevel 1 exit 1
@REM copy %LIBRARY_PREFIX%\lib\qt6\bin\Assistant.exe %LIBRARY_PREFIX%\bin\Assistant6.exe
@REM if errorlevel 1 exit 1
@REM copy %LIBRARY_PREFIX%\lib\qt6\bin\qdistancefieldgenerator.exe %LIBRARY_PREFIX%\bin\qdistancefieldgenerator6.exe
@REM if errorlevel 1 exit 1
@REM copy %LIBRARY_PREFIX%\lib\qt6\bin\qtplugininfo.exe %LIBRARY_PREFIX%\bin\qtplugininfo6.exe
@REM if errorlevel 1 exit 1
@REM copy %LIBRARY_PREFIX%\lib\qt6\bin\qdbus.exe %LIBRARY_PREFIX%\bin\qdbus6.exe
@REM if errorlevel 1 exit 1
@REM copy %LIBRARY_PREFIX%\lib\qt6\bin\qdbusviewer.exe %LIBRARY_PREFIX%\bin\qdbusviewer6.exe
@REM if errorlevel 1 exit 1
@REM copy %LIBRARY_PREFIX%\lib\qt6\bin\qtdiag.exe %LIBRARY_PREFIX%\bin\qtdiag6.exe
@REM if errorlevel 1 exit 1
