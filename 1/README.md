> 使用 python3 撰寫

將 `unzipper.py` 檔案下載到本地，使用的壓縮檔 `1.zip` 不需要跟檔案處在同目錄底下，解壓縮後的 `unzipped` 資料夾則是會跟 `unzipper.py` 處在同一目錄底下。

使用方法：

1. 如果 `1.zip` 跟 `unzipper.py` 處在同一目錄底下，直接使用
壓縮檔名稱即可：

ex: `python3 unzipper.py 1.zip`

2. 如果 `1.zip` 並非在同一目錄底下，則輸入壓縮檔的絕對路徑

ex: `python3 unzipper.py /Users/jameslee/Downloads/some_folder/1.zip`