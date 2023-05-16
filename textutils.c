#include <stdio.h>
#include <sys/ioctl.h>

#include "textutils.h"

void setCursor(int x, int y){
  printf("\033[%d;%dH", x, y);
}

void clearScreen(){
  printf("\033[2J\033[1;1H");
}

void clearLine(){
  printf("\33[2K\r");
}

void getTerminalSize(int* x, int* y){
  struct winsize win;
  ioctl(0, TIOCGWINSZ, &win);
  *x = win.ws_col;
  *y = win.ws_row;
}

void clearText(){
  printf("\033[0;0m");
}

void boldText(){
  printf("\033[0;1m");
}

void rgbText(int r, int g, int b){
  printf("\033[38;2;%d;%d;%dm", r, g, b);
}

void underText(){
  printf("\033[0;4m");
}

void negativeText(){
  printf("\033[47;30m");
}

void crossedText(){
  printf("\033[9m");
}
