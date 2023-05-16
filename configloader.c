#include "configloader.h"

void sigintHandler(int i){
  clearScreen();
  printf("Catched <Ctrl-C>, exiting program\n");
  exit(255);
}

Config* loadConfig(){
  Config* config = (Config*)malloc(sizeof(Config));
  return config;
}

void createConfigDefault(){

}

void updateConfig(){

}

