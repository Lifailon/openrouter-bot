Helm chart for installing the [OpenRouter Bot](https://github.com/Lifailon/openrouter-bot) in Kubernetes cluster.

```bash
helm repo add openrouter-bot https://lifailon.github.io/openrouter-bot

helm upgrade --install openrouter-bot openrouter-bot/openrouter-bot \
    --set API_KEY="sk-or-v1-XXX" \
    --set TELEGRAM_BOT_TOKEN="7777777777:XXX" \
    --set ADMIN_IDS="7777777777" \
    --set ALLOWED_USER_IDS="7777777777\,8888888888" \
    --set BASE_URL=https://openrouter.ai/api/v1 \
    --set MODEL=deepseek/deepseek-r1:free \
    --set VISION=false \
    --set MAX_HISTORY_SIZE=20 \
    --set MAX_HISTORY_TIME=60 \
    --set GUEST_BUDGET=0 \
    --set LANG=RU \
    --set STATS_MIN_ROLE=ADMIN
```