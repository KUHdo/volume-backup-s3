FROM minio/mc:RELEASE.2021-03-12T03-36-59Z

RUN microdnf install gzip tar

ADD entrypoint.sh /usr/local/bin

WORKDIR /opt

ENTRYPOINT [ "entrypoint.sh" ]
CMD ["run"]
