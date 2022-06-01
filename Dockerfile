# Minio server's dockerfile. Minio is used to store artifacts.

FROM quay.io/minio/minio

ENV MINIO_ROOT_USER='minioadmin'
ENV MINIO_ROOT_PASSWORD='verysecretpassword'

RUN curl https://dl.min.io/client/mc/release/linux-amd64/mc --output /usr/local/bin/mc 
RUN chmod a+x /usr/local/bin/mc 
RUN mc update
RUN mkdir -p /buckets/ml-bucket

ENTRYPOINT ['server', '/tmp/minio']
