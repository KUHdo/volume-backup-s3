# Docker Volume backup s3

Small sidecar container based on minio command line image package to create volume backups to s3 buckets.

## Usage

```
docker run \
    --env RM_OLDER_THAN=7 \
    --env S3_HOST=<YOUR_S3_BUCKET_HOST> \
    --env S3_KEY=<YOUR_S3_KEY> \
    --env S3_SECRET=<YOUR_S3_SECRET> \
    --env S3_BUCKET=mybucket/backup \
    --volume /src:/opt/volume \
    kuhdo/volume-backup-s3
```

## Environment Variables

`RM_OLDER_THAN` (optional)

Remove files older than `${days} ${hours} ${minutes}`.

eg: `0 0 2` => older than 2 minutes.

`S3_HOST`

Address of s3 endpoint.

`S3_KEY`

Access key of s3.

`S3_SECRET`

Secret Key of s3.

`S3_BUCKET`

Path of s3 bucket.
