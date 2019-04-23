# Forge MOD

1. [Forge](https://files.minecraftforge.net/) の Installer をダウンロードする。  
    (**ウェブサイトの広告に惑わされないように注意**)

1. ダウンロードした Forge インストーラーを実行する。  
    システムに JRE がインストールされていない場合は、MinecraftLauncher に含まれているランタイムを使用することもできる。

    * Windows の場合
        ```
        "%ProgramFiles(x86)%\Minecraft\runtime\jre-x64\1.8.0_25\bin\java" -jar forge-installer.jar
        ```

        既定のインストール先:
        ```
        %APPDATA%\.minecraft\
        ```

    * Mac の場合
        ```
        /Applications/Minecraft.app/Contents/runtime/jre-x64/1.8.0_74/bin/java -jar forge-installer.jar
        ```

        既定のインストール先:
        ```
        ~/Library/Application\ Support/minecraft/
        ```

1. バニラと MOD 用のワールドの混同を避けるため、ゲームディレクトリを変更してもよい。
    ```
    MinecraftLauncher > 起動オプション > forge プロファイル > ゲームディレクトリ
    ```

1. 追加したい MOD (.jar ファイル) を、`ゲームディレクトリ/mods` ディレクトリに配置すると、MOD が利用できるようになる。

## ゲームディレクトリについて
+ `mods` : MOD (.jar ファイル) を配置するディレクトリ。
+ `resourcepacks` : リソースパックを配置するディレクトリ。
+ `saves` : ワールドデータが保存されるディレクトリ。
+ `options.txt` : ゲームの設定ファイル。

# 8x9Craft MOD

1. [8x9Craft](http://wiki.craft.8x9.jp/wiki/Download) の MOD ファイル (`mc8x9-x.x.x.xxxx.jar`) をダウンロードする。

1. `ゲームディレクトリ/mods` ディレクトリに、ダウンロードした MOD ファイルを配置する。

1. ゲームを起動し、`/js` コマンドを入力すると、コードエディタの URL が表示されるので、ウェブブラウザーで開く。

1. `コードエディタ > はっくんの設定メニュー > エディタを開く` から、ブロックエディタかコードエディタを選択できる。

# Raspberry Jam Mod

1. python 2.7 or 3+ をインストールする。

1. サンプルスクリプト内で、画像処理ライブラリ (PIL, Pillow) が使用されているので、pip からインストールしておくとよい。

    * Windows の場合、`<PythonDir>/Scripts/pip` を使用する。

    * Mac の場合、`easy_install` で `pip` をインストールできる。
        ```
        easy_install --user pip

        echo 'PATH="$HOME/Library/Python/2.7/bin:$PATH"' >> ~/.bash_profile
        source ~/.bash_profile
        ```


    ```
    pip install --user Pillow
    ```

1. 必要であれば PyLint などの、Linter もインストールしておく。
    ```
    pip install --user pylint
    ```

1. [Raspberry Jam Mod](https://github.com/arpruss/raspberryjammod/releases) から `mods.zip` と `python-scripts.zip` をダウンロードする。

1. `mods.zip` を展開し、適合するバージョンの `RaspberryJamMod.jar` を、`ゲームディレクトリ/mods` ディレクトリに、配置する。

1. `python-scripts.zip` を作業ディレクトリに展開する。

1. ゲームを起動し、スクリプトファイルを実行し、動作すれば成功。
    ```
    python helloworld.py
    ```

# Malmo

## Windows に手動インストールする場合。
https://github.com/Microsoft/malmo/blob/master/doc/install_windows_manual.md

1. https://github.com/Microsoft/malmo/releases から、`Malmo-0.xx.x-Windows-64bit_withBoost_Python3.6.zip` をダウンロードして、展開。

1. 7-Zip

1. FFMPEG (64-bit Static) & PATH 環境変数

1. Python (3.6 64-bit) & PATH 環境変数
    ```
    pip3 install --user future Pillow
    ```
1. JDK (8 64-bit) & JAVA_HOME 環境変数

1. MALMO_XSD_PATH 環境変数 (<Malmo_home_dir>/Schemas)

1. Client を起動
    ```
    cd <Malmo_home_dir>/Minecraft
    ./launchClient.bat
    ```

1. サンプルスクリプトを実行
    ```
    cd <Malmo_home_dir>/Python_Examples
    python build_test.py
    ```

1. チュートリアル (`Python_Examples/Tutorial.pdf`)


## Mac にインストールする場合。
https://github.com/Microsoft/malmo/blob/master/doc/install_macosx.md

# WorldEdit
1. [WorldEdit](https://minecraft.curseforge.com/projects/worldedit) から、適合するバージョンの `worldedit-forge-mcXXXXX-dist` ファイルをダウンロードし、`ゲームディレクトリ/mods` ディレクトリに、配置する。

1. ゲームを起動し、MOD のロードに成功しているかを確認。
    ```
    //schem help
    ```

1. 3D モデリングを行い、`foo.schematic` ファイルを作成する。
    * 例えば、`Autodesk Tinkercad` で `3D デザイン` し、`ブロック` モードで、`foo.schematic` ファイルに `エクスポート`する。

1. `ゲームディレクトリ/modsconfig/worldedit/schematics` ディレクトリを作成し、作成した `foo.schematic` ファイルを配置する。

1. ゲームコマンド `//schem list` で、作成した `foo.schematic` が一覧に載ることを確認する。

1. ゲームコマンド `//schem load foo` でロード後 `//paste` すると、ワールドにオブジェクトが配置される。

## obj ファイルから、schematic ファイルに変換する方法

[binvox](https://www.patrickmin.com/binvox/) を使うと簡単。

```コマンド例
binvox -t schematic -down -down -rotx -rotz -rotz -rotz foo.obj
```

* -t オプション: ターゲットのファイル形式(schematic)を指定する。
* -down オプション: ダウンサンプルを行う。複数指定可能。
* -rotx, -rotz オプション: X軸、Z軸に対して 90 度回転させる。複数指定可能。

## schematic ファイルの確認

[MagicaVoxel Viewer](https://ephtracy.github.io/index.html?page=mv_renderer) を使うと簡単。
