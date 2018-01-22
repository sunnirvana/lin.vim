#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg () {
    echo "Brief:"
    echo "    1. '.gitignore' for All"
    echo "    2. '.gitignore' for C and CXX"
    echo "    3. '.gitignore' for Java"
    echo "    4. '.gitignore' for PHP"
    echo "    5. '.gitignore' for JavaScript"
    echo "    6. '.gitignore' for Golang"
    echo "Usage:"
    echo "    1. $cmdname"
    echo "    2. $cmdname cxx"
    echo "    3. $cmdname java"
    echo "    4. $cmdname php"
    echo "    5. $cmdname js"
    echo "    6. $cmdname go"
    echo "Try again"
    echo ""
}

if [[ $# -gt 1 ]]; then
    helpmsg
    exit 1
fi

# error: repository not exist
if ! git status 1>/dev/null 2>&1; then
    echo "error: git repository not exist"
    helpmsg
    exit 1
fi

branch=$(git status | head -n 1 | awk '{print $3}')
git pull

cd $(groot)

echo "[lin-vim] update $PWD/.gitignore"
touch .gitignore

# gitnore start
echo "#" >> .gitignore
echo "# [lin-vim] gitnore" >> .gitignore
echo "#" >> .gitignore

# project files
echo "*.idea" >> .gitignore
echo ".idea" >> .gitignore
echo "*.iml" >> .gitignore
echo "cmake-build-debug" >> .gitignore
echo "*.svn" >> .gitignore
echo ".svn" >> .gitignore
echo "tags" >> .gitignore
echo "cscope.out" >> .gitignore
echo "cscope.in.out" >> .gitignore
echo "cscope.po.out" >> .gitignore
echo "cscope.files" >> .gitignore
echo "ncscope.out" >> .gitignore
echo ".ycm_extra_conf.py" >> .gitignore
echo "CMakeCache.txt" >> .gitignore
echo "CMakeFiles" >> .gitignore
echo "cmake_install.cmake" >> .gitignore
echo "install_manifest.txt" >> .gitignore
echo ".vscode" >> .gitignore
echo "*.vscode" >> .gitignore
echo "*.vsproj" >> .gitignore
echo "*.gradle" >> .gitignore
echo ".gradle" >> .gitignore
echo "*.m2" >> .gitignore
echo ".m2" >> .gitignore
echo "MANIFEST.MF" >> .gitignore
echo "Manifest.mf" >> .gitignore
echo "manifest.mf" >> .gitignore

# macOS filesystem
echo ".DS_Store" >> .gitignore
echo "*/.DS_Store" >> .gitignore

# bin files
echo "*.slo" >> .gitignore
echo "*.lo" >> .gitignore
echo "*.o" >> .gitignore
echo "*.obj" >> .gitignore
echo "*.pro.user" >> .gitignore
echo "*.so" >> .gitignore
echo "*.so.*" >> .gitignore
echo "*.dylib" >> .gitignore
echo "*.dylib.*" >> .gitignore
echo "*.dll" >> .gitignore
echo "*.dll.*" >> .gitignore
echo "*.swp" >> .gitignore
echo "*.lai" >> .gitignore
echo "*.la" >> .gitignore
echo "*.a" >> .gitignore
echo "*.a.*" >> .gitignore
echo "*.lib" >> .gitignore
echo "*.lib.*" >> .gitignore
echo "*.rdb" >> .gitignore
echo "*.exe" >> .gitignore
echo "*.out" >> .gitignore
echo "*.app" >> .gitignore
echo "*.xcuserdata" >> .gitignore
echo "__pycache__" >> .gitignore
echo "*.pyc" >> .gitignore
echo "*.jar" >> .gitignore
echo "*.class" >> .gitignore

# log files
echo "*.log" >> .gitignore
