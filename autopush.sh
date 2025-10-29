cd /workspaces/server || exit
while true; do
    git add .
    git commit -m "auto pushed: $(date '+%Y-%m-%d %H:%M:%S')" || echo "No changes to commit"
    git push
    SLEEP_TIME=$((200 + RANDOM % 50))
    echo "Next auto-commit in $SLEEP_TIME seconds..."
    sleep $SLEEP_TIME
done
# cmmandns
# chmod +x autopush.sh
# ./autopush.sh
