import os
import tempfile

PROJECT_FOLDER_NAME = "qrcode_generator"


def get_tmp_directory_path():
    tmp_folder = tempfile.gettempdir()
    project_path = os.path.join(tmp_folder, PROJECT_FOLDER_NAME)
    if not os.path.exists(project_path):
        os.makedirs(project_path)
    return project_path


def get_random_filepath(filename: str):
    return os.path.join(get_tmp_directory_path(), filename)


def load_bynary_file(file_path: str):
    with open(file_path, 'rb') as r:
        res = r.read()
    return res
