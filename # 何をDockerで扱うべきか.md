# 何をDockerで扱うべきか
dockerが行うことはコンテナを運用すること。
コンテナを運用するメリットは主に２つ。
- クリーンな環境から作り上げるので、どのPCでもdockerさえ入っていれば基本的に動く。
=> 環境構築の手間がいらない。ホストマシンのOSに依存しない。

- VMを作るのに比べて軽い、早い
仮想環境用のOSを新たに構築する代わりにDockerEngineが仲介してくれるので、その分軽く早くなる

- クラウド環境へのデプロイが容易になる。
=> ほとんどのクラウドベンダーがコンテナでのデプロイをサポートしているし、今はその手法が標準になりつつある（と思ってる）。

---

上のメリットに該当するなら使えばよい。該当しなければまだ必要ない。
主なユースケースは以下。
- フロントとバックエンドの開発が分かれているとき
- windows上でlinuxを使いたいとき
- クラウド環境にデプロイしたいとき


# それをDockerで扱うためにはどんな設定のDockerファイルを書けばいいのか
1. まず適切なdocker imageを調べる
    公式が出しているものを選ぶ。非公式はセキュリティの危険が高いので、使うくらいならDockerfileで１から（ubuntuなど基本OSから）自分で構築したほうが、手間だが確実。

2. Dockerfileで何でもかんでも書く必要はない
- FROM
- RUN
- WORKDIR
- COPY
- CMD

のコマンドだけ使えばよいと思ってる。
他のコマンドはこれらで代用できる。

---

さらに込み入ったことがしたければdocker compose使う。

- port指定
- volume指定
- 環境変数の設定
- コンテナ間通信など