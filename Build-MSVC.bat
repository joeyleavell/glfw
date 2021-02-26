rmdir /S /Q Build\MSVC
rmdir /S /Q Install\MSVC
cmake -D GLFW_BUILD_EXAMPLES=OFF -D GLFW_BUILD_TESTS=OFF -D GLFW_BUILD_DOCS=OFF -D BUILD_SHARED_LIBS=ON -D CMAKE_INSTALL_PREFIX="./Install/MSVC" -H. -BBuild/MSVC
cmake --build ./Build/MSVC --config Release
cmake --install ./Build/MSVC --config Release

:: Install the artifacts
mkdir ..\Extern\Glfw\Include\
mkdir ..\Extern\Glfw\Libraries\x64\Windows\MSVC\
mkdir ..\Extern\Glfw\Binary\x64\Windows\MSVC\
xcopy /Y /E .\Install\MSVC\Include\GLFW\ ..\Extern\Glfw\Include\
copy /Y .\Install\MSVC\lib\glfw3dll.lib ..\Extern\Glfw\Libraries\x64\Windows\MSVC\glfw3dll.lib
copy /Y .\Install\MSVC\bin\glfw3.dll ..\Extern\Glfw\Binary\x64\Windows\MSVC\glfw3.dll