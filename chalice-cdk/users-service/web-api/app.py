import os
import boto3
from chalice import Chalice

app = Chalice(app_name='web-api')

dynamodb = boto3.resource('dynamodb')
dynamodb_table = dynamodb.Table(os.environ['DYNAMODB_TABLE_NAME'])


@app.route('/users', methods=['POST'])
def create_user():
    user = app.current_request.json_body
    dynamodb_table.put_item(Item=user)
    return user

@app.route('/users/{username}', methods=['GET'])
def get_user(username):
    response = dynamodb_table.get_item(Key={'username': username})
    return response['Item']

@app.route('/users/{username}', methods=['DELETE'])
def delete_user(username):
    dynamodb_table.delete_item(Key={'username': username})