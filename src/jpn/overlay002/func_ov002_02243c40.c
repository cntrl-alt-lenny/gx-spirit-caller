#include "ov002_core.h"

struct F6View {
    u16 lo : 8;
    u16 hi : 8;
};

extern int func_ov002_021bc47c(int player, int idx);

int func_ov002_02243c40(struct Ov002Self *self, int player, int idx) {
    int i;
    int count;
    unsigned short packed;

    if (player == self->b0)
        return 0;
    if (idx > 4)
        return 0;
    if (func_ov002_021bc47c(player, idx) == 0)
        return 0;

    i = 0;
    count = ((unsigned)(*(unsigned short *)((char *)self + 6) << 16)) >> 24;
    if (count <= 0)
        goto ret1;

    packed = (unsigned short)((unsigned char)player | ((unsigned char)idx << 8));

    do {
        if (packed == ((unsigned short *)self)[i + 4])
            return 0;
        i++;
    } while (i < count);

ret1:
    return 1;
}
