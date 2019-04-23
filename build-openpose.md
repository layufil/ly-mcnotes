# OpenPose on Windows

## Visual Studio 2015
+ プログラミング言語
    + [x] Visual C++
    + [x] Python for Visual Studio

## CUDA & cuDNN
### [CUDA 8](https://developer.nvidia.com/cuda-80-ga2-download-archive)
- cuda_8.0.61_win10.exe
- cuda_8.0.61.2_windows.exe (Updater)

**カスタムインストールを選択し、ドライバーや、GeforceExperience など、不要なものは、チェックを外すこと。**

**インストール先は、デフォルトのままにしておく。(OpenPose が固定パスを見るらしい)**

### [cuDNN 5.1](https://developer.nvidia.com/cudnn)
- cudnn-8.0-windows10-x64-v5.1.zip

CUDA のインストール先へ、中身をコピーする。

## Python

- python-2.7.15.amd64.msi

**python27.dll が必要になる。**

## ソースコードの準備
```
git clone -b master --depth=1 https://github.com/CMU-Perceptual-Computing-Lab/openpose.git

$env:PYTHON_LIB="${env:SystemDrive}\Python27\libs"
cd <openpose_home>/3rdparty/windows
./getCaffe.bat
./getCaffe3rdparty.bat    # boost をすべて上書きする
./getOpenCV.bat

cd <openpose_home>/models
./getModels.bat
```

## Cmake

1. Install Cmake

      cmake-3.12.1-win64-x64.msi

      + [x] Add CMake tot the system PATH for the current user

1. cmake-gui configuration

    - Where is the source code: <openpose_home>
    - Where to build the binaries: <openpose_build_dir>

1. `Configure` ボタンを押す。

    - Visual Studio 14 2015 Win64

    - GPU_MODE: CPU_ONLY (CPU バージョンをビルドする場合)

1. 設定エラーが出ている部分を直し、再度 `Configure` ボタンを押す。

1. `Generate` ボタンを押す。

1. Visual Studio で `<openpose_build_dir>/OpenPose.sln` を開き、ビルドする。


## OpenPoseDemo

デフォルトでは、カメラから、1280x720@30fps で入力する。

```
OpenPoseDemo
```

カメラの映像が入力されない場合は、オプション (`-camera_resolution` や `-camera_fps`など) を指定するとよい。

```
OpenPoseDemo -camera_resolution 640x480
```

ビデオファイルを入力ソースとする場合。

```
OpenPoseDemo -video examples/media/video.avi
```

画像ファイルを入力ソースとする場合。

```
OpenPoseDemo -image_dir examples/media/
```
