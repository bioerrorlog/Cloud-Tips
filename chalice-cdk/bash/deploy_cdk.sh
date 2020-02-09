#!/bin/bash

# CDKテンプレート生成
cdk synth
# CDKデプロイ
cdk deploy WebApiDev

# WebAPIエンドポイントのテスト
$ curl \
    -H "Content-Type: application/json" \
    -X POST \
    -d '{"username":"john", "email":"john@example.com"}' \
    https://n6doqg3ewl.execute-api.eu-west-1.amazonaws.com/v1/users

# クリーンアップ
cdk destroy WebApiDev