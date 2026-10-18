#include "ov002_core.h"
extern int func_ov002_0223df38(void *self, int flag, int *out);
extern int func_ov002_021bb068(int cmd);
extern int func_ov002_021d63fc(void *self, int a, int b, int c);

struct Self022177d4_F4 {
    unsigned short _pad0_1 : 2;
    unsigned short bit2 : 1;
    unsigned short _rest : 13;
};
struct Self022177d4 {
    unsigned short f0;
    unsigned short f2;
    struct Self022177d4_F4 f4;
};

int func_ov002_022177d4(struct Self022177d4 *self) {
    int local;
    unsigned char byte0;
    int player, idx;
    char *row;
    struct Ov002Slot *slot;

    if (self->f4.bit2 != 0) return 0;
    if (func_ov002_021bb068(0x135d) != 0) return 0;
    if (func_ov002_0223df38(self, 0, &local) == 0) {
        goto done;
    }
    byte0 = (unsigned char)local;
    player = byte0 & 1;
    idx = ((unsigned short)local >> 8) & 0xff;
    row = data_ov002_022cf1a4 + player * 0x868;
    if (*(unsigned short *)(row + idx * 0x14) != 0) {
        func_ov002_021d63fc(self, byte0, idx, 0);
    }
done:
    return 0;
}
