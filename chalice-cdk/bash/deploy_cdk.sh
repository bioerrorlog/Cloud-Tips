#!/bin/bash

# CDKテンプレート生成
cdk synth
# CDKデプロイ
cdk deploy WebApiDev

# WebAPIエンドポイントのテスト
$ curl \
    -H "Content-Type: application/json" \
    -X POST \
    -d '{"username":"bioerrorlog", "email":"bioerrorlog@example.com"}' \
    https://0oexyzw39c.execute-api.ap-northeast-1.amazonaws.com/v1/users

# クリーンアップ
cdk destroy WebApiDev