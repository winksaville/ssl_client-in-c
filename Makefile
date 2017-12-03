CFLAGS=-Wall
#CFLAGS=
LFLAGS=-L/usr/lib -lssl -lcrypto

.PHONY: all
all: ssl_client

ssl_client: ssl_client.c
	gcc $(CFLAGS) -o ssl_client ssl_client.c $(LFLAGS)

.PHONY: gencert
gencert:
	openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem

clean:
	rm ./ssl_client