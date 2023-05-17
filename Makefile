CC = gcc
CFLAGS = 
$(shell mkdir -p lib bin)

pacman: textutils.so player.so pacutils.so ghosts.so configloader.so maps.so main.o
	$(CC) $(CFLAGS) -o bin/pacman main.o --std=c11 -Wl,-rpath,. -L. -l./lib/textutils -l./lib/player -l./lib/pacutils -l./lib/ghosts -l./lib/configloader -l./lib/maps
	rm -r *.o

debug: textutils.so player.so pacutils.so ghosts.so configloader.so maps.so main.o
	$(CC) $(CFLAGS) -o bin/debug main.o --std=c11 -Ddebug -Wl,-rpath,./lib/ -L./lib/ -ltextutils -lplayer -lpacutils -lghosts -lconfigloader -lmaps
	rm -r *.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

configloader.so: configloader.c
	$(CC) $(CFLAGS) -c configloader.c
	$(CC) $(CFLAGS) --shared -o lib/configloader.so configloader.o

ghosts.so: ghosts.c
	$(CC) $(CFLAGS) -c ghosts.c
	$(CC) $(CFLAGS) --shared -o lib/ghosts.so ghosts.o

maps.so: maps.c
	$(CC) $(CFLAGS) -c maps.c
	$(CC) $(CFLAGS) --shared -o lib/maps.so maps.o

pacutils.so: pacutils.c
	$(CC) $(CFLAGS) -c pacutils.c
	$(CC) $(CFLAGS) --shared -o lib/pacutils.so pacutils.o

player.so: player.c
	$(CC) $(CFLAGS) -c player.c
	$(CC) $(CFLAGS) --shared -o lib/player.so player.o

textutils.so: textutils.c
	$(CC) $(CFLAGS) -c textutils.c
	$(CC) $(CFLAGS) --shared -o lib/textutils.so textutils.o

clean:
	rm -rf bin
	rm -rf lib

