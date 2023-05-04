import json
import boto3


def lambda_handler(event, context):
    ses = boto3.client('ses', region_name='us-east-1')

    source_email = 'mohamedsorour1998@gmail.com'
    destination_email = 'mohamedsorour1998@gmail.com'

    subject = 'Terraform State File Updated'
    message_body = 'The Terraform state file has been updated, sent from an AWS Lambda function using Amazon SES.'

    response = ses.send_email(
        Source=source_email,
        Destination={
            'ToAddresses': [
                destination_email,
            ],
        },
        Message={
            'Subject': {
                'Data': subject,
            },
            'Body': {
                'Text': {
                    'Data': message_body,
                },
            },
        },
    )

    return {'statusCode': 200, 'body': json.dumps('Email sent successfully!')}
