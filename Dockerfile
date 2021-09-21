FROM golang:1.10

# Adding third party libraries
WORKDIR /tmp
RUN apt-get update -y
RUN apt-get install -y apt-utils curl git mercurial make binutils bison gcc build-essential
RUN apt-get install -y git git-core alien pkg-config libaio1

# Installing Oracle client
ADD oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm /tmp/
ADD oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm /tmp/
ADD oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm /tmp/
ADD install_oracle.sh /tmp/
WORKDIR /tmp
RUN chmod +x install_oracle.sh
RUN ["./install_oracle.sh"]
ADD oci8.pc /usr/lib/pkgconfig/
RUN source ~/.bashrc

RUN go mod tidy
RUN go mod verify

RUN go build -o app

CMD ["./app"]