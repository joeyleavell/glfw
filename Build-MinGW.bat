rmdir /S /Q Build\MinGW
rmdir /S /Q Install\MinGW
cmake -G "MinGW Makefiles" -D GLFW_BUILD_EXAMPLES=OFF -D GLFW_BUILD_TESTS=OFF -D GLFW_BUILD_DOCS=OFF -D BUILD_SHARED_LIBS=ON -D CMAKE_INSTALL_PREFIX="./Install/MinGW" -H. -BBuild/MinGW
cmake --build ./Build/MinGW --config Release
cmake --install ./Build/MinGW --config Release

:: Install the artifacts
mkdir ..\Extern\Glfw\Include\
mkdir ..\Extern\Glfw\Libraries\x64\Windows\MinGW\
mkdir ..\Extern\Glfw\Binary\x64\Windows\MinGW\
xcopy /Y /E .\Install\MinGW\Include\GLFW\ ..\Extern\Glfw\Include\
copy /Y .\Install\MinGW\lib\libglfw3dll.a ..\Extern\Glfw\Libraries\x64\Windows\MinGW\libglfw3dll.a
copy /Y .\Install\MinGW\bin\glfw3.dll ..\Extern\Glfw\Binary\x64\Windows\MinGW\glfw3.dll