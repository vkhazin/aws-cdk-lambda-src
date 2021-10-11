import json
import datetime
from kafka import KafkaProducer

def handler(event, context):
    print(event)
    print(datetime.datetime.now())
    producer = KafkaProducer(bootstrap_servers='localhost:1234')
    return {
            "statusCode": 200,
            "headers": {
                "Content-Type": "application/json",
                'Access-Control-Allow-Headers': 'Content-Type',
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': 'OPTIONS,POST,GET'
            },
            "body": json.dumps(event),
        }