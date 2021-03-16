#!/bin/sh

if [ "$1" = "run" ]; then
    [ -z "$S3_HOST" ] ||
    [ -z "$S3_KEY" ] ||
    [ -z "$S3_SECRET" ] ||
    [ -z "$S3_BUCKET" ] &&
    exit

    file="$(date -Iseconds)"

    tar -czf "$file".tar.gz --force-local ./volume && file="$file".tar.gz || exit

    alias=s3
    mc alias set "$alias" "$S3_HOST" "$S3_KEY" "$S3_SECRET" --api S3v4 > /dev/null

    target="$alias/$S3_BUCKET"

    if [ -n "$RM_OLDER_THAN" ]; then
      minutes=$(echo "$RM_OLDER_THAN" | awk '{print ($1 * 24 * 60) + ($2 * 60) + $3}')
      mc rm -r --force --older-than "$minutes"m --no-color --json "$target"
    fi

    exec mc cp "$file" "$target/" --no-color --json
else
    exec "$@"
fi
