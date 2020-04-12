#!/bin/bash

# ワークスペースの作成
cd ..
mkdir infra
cd infra

# CDKプロジェクトの作成
cdk init --language python --generate-only

# デフォルトのinfraファイルは削除して、後から新しく作成する
rm -rf infra
# Construct libraryを作るわけではないのでsetup.pyは不要
rm setup.py

# 必要なツールをrequirements.txtに放り込んでインストール
echo "aws-cdk.aws-dynamodb" > requirements.txt
echo "aws-cdk.core" >> requirements.txt
echo "cdk-chalice==0.6.0" >> requirements.txt # 現時点でのlatest version: 0.7.0ではインストールに失敗した
pip install -r requirements.txt

# 新規のstacksパッケージを作成
mkdir stacks
touch stacks/__init__.py
touch stacks/web_api.py

