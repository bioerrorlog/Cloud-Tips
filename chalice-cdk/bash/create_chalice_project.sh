#!/bin/bash

# 前準備: CDKのインストール
npm install -g aws-cdk

# ワークスペースの作成
mkdir users-service
cd users-service

# Python仮想環境の作成とアクティブ化
python3 -m venv .venv
source .venv/bin/activate

# Chaliceインストールとプロジェクトの作成
pip install chalice==1.12.0
chalice new-project web-api
cd web-api

# 必要なツールをrequirements.txtに放り込んでインストール
echo "boto3==1.10.30" > requirements.txt
echo "chalice==1.12.0" >> requirements.txt
pip install -r requirements.txt