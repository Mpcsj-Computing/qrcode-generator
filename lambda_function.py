import json
from qrcode_service import generate_image
from file_utils import load_bynary_file
import base64


def lambda_handler(event, context):
    body_str_base64 = event['body']
    body_str = base64.b64decode(body_str_base64)
    message = json.loads(body_str)['message']
    file_path = generate_image(message)
    image = load_bynary_file(file_path)
    res = base64.b64encode(image).decode('utf-8')
    return {
        'headers': {'Content-Type': 'image/jpeg', 'Content-Disposition': 'attachment'},
        'statusCode': 200,
        'body': res,
        'isBase64Encoded': True
    }
