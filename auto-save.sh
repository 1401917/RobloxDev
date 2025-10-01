#!/bin/bash
# שמירה אוטומטית של RBX/Load.html בכל שינוי

WATCHED_FILE="RBX/Load.html"

cd "$(dirname "$0")"

echo "מנטר שינויים ב-$WATCHED_FILE..."

while inotifywait -e close_write "$WATCHED_FILE"; do
  git add "$WATCHED_FILE"
  git commit -m "שמירה אוטומטית: עדכון $WATCHED_FILE"
  git push
  echo "בוצעה שמירה ודחיפה אוטומטית ל-GitHub."
done
