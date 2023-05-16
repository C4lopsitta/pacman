#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <locale.h>
#include <wchar.h>

#include "defines.h" //contains all definitions, including typedefs and struct/enum definitions
#include "tablechars.h" //contains definitions for characters in the unicode range

#include "textutils.h"
#include "pacutils.h"
#include "player.h"
#include "ghosts.h"
#include "configloader.h"
#include "maps.h"

int main (int argc, char **argv){
  signal(SIGINT, sigintHandler);
  Config* config = loadConfig();
  setlocale(LC_ALL, "en_US.UTF-8");
  wint_t x = 0x2563;
  printf("%lc\n", x);
}

