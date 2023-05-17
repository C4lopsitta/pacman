CC = gcc
CFLAGS = 
$(shell mkdir -p lib bin)

pacman: textutils.so player.so pacutils.so ghosts.so configloader.so maps.so main.o
	$(CC) $(CFLAGS) -o bin/pacman main.o -std=c11 -Wl,-rpath,./lib/ -L./lib/ -ltextutils -lplayer -lpacutils -lghosts -lconfigloader -lmaps -march=native -O2
	rm -r *.o

debug: textutils.so player.so pacutils.so ghosts.so configloader.so maps.so main.o
	$(CC) $(CFLAGS) -o bin/debug main.o --std=c11 -Ddebug -Wl,-rpath,./lib/ -L./lib/ -ltextutils -lplayer -lpacutils -lghosts -lconfigloader -lmaps
	rm -r *.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

configloader.so: configloader.c
	$(CC) $(CFLAGS) -c configloader.c
	$(CC) $(CFLAGS) --shared -o lib/libconfigloader.so configloader.o

ghosts.so: ghosts.c
	$(CC) $(CFLAGS) -c ghosts.c
	$(CC) $(CFLAGS) --shared -o lib/libghosts.so ghosts.o

maps.so: maps.c
	$(CC) $(CFLAGS) -c maps.c
	$(CC) $(CFLAGS) --shared -o lib/libmaps.so maps.o

pacutils.so: pacutils.c
	$(CC) $(CFLAGS) -c pacutils.c
	$(CC) $(CFLAGS) --shared -o lib/libpacutils.so pacutils.o

player.so: player.c
	$(CC) $(CFLAGS) -c player.c
	$(CC) $(CFLAGS) --shared -o lib/libplayer.so player.o

textutils.so: textutils.c
	$(CC) $(CFLAGS) -c textutils.c
	$(CC) $(CFLAGS) --shared -o lib/libtextutils.so textutils.o

clean:
	rm -rf bin
	rm -rf lib
	rm -rf *.o

