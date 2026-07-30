#include "ov002_core.h"

extern int func_ov002_0223df38(struct Ov002Self *self, int a, int b);
extern int func_ov002_0225764c(struct Ov002Self *self, int a, int b);
extern int func_ov002_021de4d8(struct Ov002Self *self, int a, int b);
extern void func_ov002_021df818(struct Ov002Self *self, int a, int b);

int func_ov002_022221dc(struct Ov002Self *self) {
    if (func_ov002_0223df38(self, 0, 0) != 0) {
        unsigned int packed = func_ov002_0223de94(self, 0);
        int byte0 = packed & 0xff;
        int byte1 = ((unsigned short)packed >> 8) & 0xff;
        if (func_ov002_0225764c(self, byte0, byte1) != 0) {
            func_ov002_021e2b3c();
            if (func_ov002_021de4d8(self, byte0, byte1) != 0) {
                func_ov002_021df818(self, byte0, 0x1f4);
            }
            func_ov002_021e2c5c();
        }
    }
    return 0;
}
