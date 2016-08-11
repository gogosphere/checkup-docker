FROM golang

# Copy your checkup.conf to the container
ADD . /go/src/app

RUN cd /go/src/app && git clone https://github.com/sourcegraph/checkup.git
RUN cd /go/src/app/checkup/cmd/checkup/ && go get -v && go build -v

ENTRYPOINT cd /go/src/app/checkup/cmd/checkup/ && ./checkup -c /go/src/app/checkup.json every 1m
