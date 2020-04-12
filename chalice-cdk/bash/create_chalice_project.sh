#!/bin/bash

# 前準備: CDKのインストール
npm install -g aws-cdk

# ワークスペースの作成
mkdir users-service
cd users-service

# Python仮想環境の作成とアクティブ化
python3.7 -m venv .venv # Python3.7で実行する
source .venv/bin/activate

# Chaliceインストールとプロジェクトの作成
pip install chalice
chalice new-project web-api
cd web-api

# 必要なツールをrequirements.txtに放り込んでインストール
echo "boto3" > requirements.txt
echo "chalice" >> requirements.txt
pip install -r requirements.txt