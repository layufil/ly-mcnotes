# VS Code による、Forge MOD 開発環境の構築

- マイクラ MOD の開発環境について、VS Code を利用する方法を調べたので、メモ書き。
- 開発環境は、開発者が使いやすいものがよいので、IDE など、お好みのものを選べばよいと思う。

## JDK

1. [JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/index.html) をダウンロードし、インストールする。
    

1. 環境変数 `JAVA_HOME` を JDK のインストールディレクトリに設定

## Mdk

1. [Forge Mdk](https://files.minecraftforge.net/) をダウンロードし、zip ファイルを任意のディレクトリに展開する。  
    (**ウェブサイトの広告に惑わされないように注意**)

1. ターミナルを開き、Mdk を展開したディレクトリで、セットアップタスクを実行する。
    ```
    ./gradlew setupDecompWorkspace eclipse
    ```

## VS Code

1. [VS Code](https://code.visualstudio.com/) をダウンロードし、 インストールする。

1. [Java Extension Pack](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack) 拡張機能をインストールする。

1. `ファイル > フォルダーを開く` から、Mdk のディレクトリを開く。

1. `デバッグ > 構成を開く` から、構成(`launch.json`)を以下のように設定する。  
    設定値は、Gradle の `eclipse` タスクで生成した `*_Client.launch` と `*_Server.launch` ファイルの値を利用する。

    ```
    {
        "version": "0.2.0",
        "configurations": [
            {
                "type": "java",
                "name": "Client",
                "request": "launch",
                "cwd": "${workspaceFolder}/run",
                "console": "internalConsole",
                "stopOnEntry": false,
                "mainClass": "GradleStart",
                "args": "-DFORGE_FORCE_FRAME_RECALC=true"
            },
            {
                "type": "java",
                "name": "Server",
                "request": "launch",
                "cwd": "${workspaceFolder}/run",
                "console": "internalConsole",
                "stopOnEntry": false,
                "mainClass": "GradleStartServer",
                "args": "-DFORGE_FORCE_FRAME_RECALC=true"
            }
        ]
    }
    ```

1. 左端の `アクティビティーバー` から `デバッグ` のビューを開き、`Client` の構成を選択し、`デバッグの開始` をすると、デバッグを行うことができる。  
    (サーバーモードのデバッグを行う場合は、`Server` の構成を選択する。`run/eula.txt` に設定も必要。)

1. `run` ディレクトリに、ワールドデータや設定が保存される。

## JAR ファイルの生成

1. ターミナルから、ビルドタスクを実行する。

    ```
    ./gradlew build
    ```

2. `build/libs/*.jar` が、生成された MOD ファイル。  
    `.minecraft/mods` ディレクトリに配置すると、作成した MOD が通常の実行環境で有効になる。
    (`*-sources.jar` は、ソースコードのアーカイブ。)
