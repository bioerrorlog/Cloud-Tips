import os
from aws_cdk import core as cdk
from stacks.web_api import WebApi

app = cdk.App()

# Stackの環境を定義
# 'CDK_DEFAULT_ACCOUNT'と'CDK_DEFAULT_REGION'からは現在のデフォルトが読み込まれる
dev_env = cdk.Environment(
    account=os.environ['CDK_DEFAULT_ACCOUNT'],
    region=os.environ['CDK_DEFAULT_REGION'])
    
# 本番環境はアカウントidとregionを指定
prod_eu_west_1_env = cdk.Environment(account='123456789012', region='eu-west-1')
prod_us_east_1_env = cdk.Environment(account='123456789012', region='us-east-1')

# Stackを定義
WebApi(app, 'WebApiDev', env=dev_env)
WebApi(app, 'WebApiProdEuWest1', env=prod_eu_west_1_env)
WebApi(app, 'WebApiProdUsEast1', env=prod_us_east_1_env)

app.synth()