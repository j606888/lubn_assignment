from pathlib import Path
import gzip
import zipfile
import shutil
import re
import sys
import os

UNZIPPED_FOLDER = './unzipped'
  
def start(zip_path):
  Path(UNZIPPED_FOLDER).mkdir(parents=True, exist_ok=True)

  zipf = zipfile.ZipFile(zip_path)
  zipf.extractall()
  zipf.close()

  folder_name = os.path.basename(zip_path)[0]
  f = open(f"{folder_name}/list.txt", "r")
  lists = f.read().splitlines()
  f.close()

  for gz_path in lists:
    input_path = f"{folder_name}/{gz_path}"
    csv_path = re.search("/.*\.csv", gz_path).group()
    output_path = f"{UNZIPPED_FOLDER}{csv_path}"
    with gzip.open(input_path, 'rb') as f_in:
      with open(output_path, 'wb') as f_out:
        shutil.copyfileobj(f_in, f_out)
  
  shutil.rmtree(folder_name)

zip_path = sys.argv[1]
start(zip_path)

# if in same folder => python3 demo.py 1.zip
# if not is same folder, input absolute dir => python3 demo.py /Users/jameslee/Downloads/ool/1.zip