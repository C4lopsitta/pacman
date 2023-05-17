#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <locale.h>
#include <wchar.h>

#include "headers/defines.h" //contains all definitions, including typedefs and struct/enum definitions
#include "headers/tablechars.h" //contains definitions for characters in the unicode range

#include "headers/textutils.h"
#include "headers/pacutils.h"
#include "headers/player.h"
#include "headers/ghosts.h"
#include "headers/configloader.h"
#include "headers/maps.h"

int main (int argc, char **argv){
  //attach Ctrl-C handler, allocate config and set locale
  signal(SIGINT, sigintHandler);
  Config* config = loadConfig();
  setlocale(LC_ALL, "en_US.UTF-8");
  
}

