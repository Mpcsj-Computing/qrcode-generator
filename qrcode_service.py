import qrcode
import uuid
from file_utils import get_random_filepath


def generate_image(message: str, box_size=20):
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=box_size,
        border=4
    )
    qr.add_data(message)
    qr.make(fit=True)

    image = qr.make_image(fill_color="black", back_color="white")
    image_path = get_random_filepath(f'{str(uuid.uuid4())}.jpg')
    image.save(image_path, 'JPEG', quality=90, optimize=True, progressive=True)
    return image_path


if __name__ == "__main__":
    print(generate_image("Hello self perfecter"))
