FROM debian:jessie
MAINTAINER Stanislav Tarasenko <stanislaw.tarasenko@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# install Ruby
RUN apt-get update && apt-get install -yqq ruby rubygems-integration

# install fake-s3
RUN gem install fakes3 -v 1.2.1

# run fake-s3
RUN mkdir -p /s3_root

ENTRYPOINT ["/usr/local/bin/fakes3"]
CMD ["-r",  "/s3_root", "-p",  "4569"]
EXPOSE 4569
