/* func_ov002_0223ac98: same df38/de94/764c/e2b3c/de4d8/e2c5c gate chain as
 * func_ov002_022221dc, but on success looks up a slot's id (table indexed
 * by byte0&1, byte1) and classifies it via func_0202b8f0 before posting
 * func_ov002_021df818(self, 1-self->b0, classified). */
#include "ov002_core.h"

extern int func_ov002_0223df38(struct Ov002Self *self, int a, int b);
extern int func_ov002_0225764c(struct Ov002Self *self, int a, int b);
extern int func_ov002_021de4d8(struct Ov002Self *self, int a, int b);
extern void func_ov002_021df818(struct Ov002Self *self, int a, int b);
extern int func_0202b8f0(int id);

int func_ov002_0223ac98(struct Ov002Self *self) {
    if (func_ov002_0223df38(self, 0, 0) != 0) {
        unsigned int packed = func_ov002_0223de94(self, 0);
        int byte0 = packed & 0xff;
        int byte1 = ((unsigned short)packed >> 8) & 0xff;
        if (func_ov002_0225764c(self, byte0, byte1) != 0) {
            func_ov002_021e2b3c();
            if (func_ov002_021de4d8(self, byte0, byte1) != 0) {
                struct Ov002Slot *slot = (struct Ov002Slot *)((char *)data_ov002_022cf16c
                    + (byte0 & 1) * 0x868 + byte1 * 0x14 + 0x30);
                int classified = func_0202b8f0(slot->id);
                func_ov002_021df818(self, 1 - self->b0, classified);
            }
            func_ov002_021e2c5c();
        }
    }
    return 0;
}
