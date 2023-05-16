#ifndef __CONFIGLOADER_H__
#define __CONFIGLOADER_H__

#include <stdio.h>

#include "defines.h"
#include "textutils.h"

void sigintHandler(int);
Config* loadConfig();
void createConfigDefault();
void updateConfig();

#endif // __CONFIGLOADER_H__

