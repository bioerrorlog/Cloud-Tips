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
echo "aws_cdk.aws_dynamodb==1.19.0" > requirements.txt
echo "aws_cdk.core==1.23.0" >> requirements.txt
echo "cdk-chalice==0.4.0" >> requirements.txt
pip install -r requirements.txt

# 新規のstacksパッケージを作成
mkdir stacks
touch stacks/__init__.py
touch stacks/web_api.py

