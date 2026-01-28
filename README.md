Demonstrates two MSI installers that each check for the presence of the other and conditionally add their installation folders when detected. Includes sample WiX logic for cross-installer detection and folder management.

## Build FolderA MSI:
Replace PATH with your path.

```
mkdir out/build/x64-debug-a
cd out/build/x64-debug-a
cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug -DMSI_TYPE=A -DCMAKE_INSTALL_PREFIX=PATH/AppMsiTest/out/install/x64-debug PATH/AppAAndB/AppMsiTest
cmake --build .
cpack -G WIX
```

## Build FolderB MSI:
Replace PATH with your path.

```
mkdir out/build/x64-debug-b
cd out/build/x64-debug-b
cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug -DMSI_TYPE=B -DCMAKE_INSTALL_PREFIX=PATH/AppMsiTest/out/install/x64-debug PATH/AppAAndB/AppMsiTest
cmake --build .
cpack -G WIX
```
