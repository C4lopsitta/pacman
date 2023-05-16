#ifndef __TEXTUTILS_H__
#define __TEXTUTILS_H__

void setCursor(int, int);

void clearScreen();
void clearLine();
void clearText();

void getTerminalSize(int*, int*);

void rgbText(int, int, int);
void boldText();
void underText();
void negativeText();
void crossedText();

#endif //endif __TEXTUTILS_H__
