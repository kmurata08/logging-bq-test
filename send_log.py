from google.cloud import logging

# クライアントのインスタンスを作成
client = logging.Client()

# ロガーを取得/作成
logger = client.logger('action_log')

# ログを送信
logger.log_struct({
    "action_id": 226,
    "user_id": 111,
    "type": "login",
    "detail": {
        "login_method": "google",
    },
    "created_at": "1693362442"
})