CC = gcc
CFLAGS = 
$(shell mkdir -p lib bin)

pacman: libtextutils.a libplayer.a libpacutils.a libghosts.a libconfigloader.a libmaps.a main.o
	$(CC) $(CFLAGS) -o bin/pacman main.o -L. lib/libtextutils.a lib/libplayer.a lib/libpacutils.a lib/libghosts.a lib/libconfigloader.a lib/libmaps.a
	rm -r main.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

libconfigloader.a: configloader.c
	$(CC) $(CFLAGS) -c configloader.c
	ar r lib/libconfigloader.a configloader.o
	rm -r configloader.o

libghosts.a: ghosts.c
	$(CC) $(CFLAGS) -c ghosts.c
	ar r lib/libghosts.a ghosts.o
	rm -r ghosts.o

libmaps.a: maps.c
	$(CC) $(CFLAGS) -c maps.c
	ar r lib/libmaps.a maps.o
	rm -r maps.o

libpacutils.a: pacutils.c
	$(CC) $(CFLAGS) -c pacutils.c
	ar r lib/libpacutils.a pacutils.o
	rm -r pacutils.o

libplayer.a: player.c
	$(CC) $(CFLAGS) -c player.c
	ar r lib/libplayer.a player.o
	rm -r player.o

libtextutils.a: textutils.c
	$(CC) $(CFLAGS) -c textutils.c
	ar r lib/libtextutils.a textutils.o
	rm -r textutils.o

clean:
	rm -rf bin
	rm -rf lib

