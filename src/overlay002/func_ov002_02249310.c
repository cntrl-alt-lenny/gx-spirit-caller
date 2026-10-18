#include "ov002_core.h"
extern int data_ov002_022cf180[];
extern int func_0202e234(int);

struct Ov002Ent {
    unsigned int id : 13;
    unsigned int rest : 19;
};

void func_ov002_02249310(int player) {
    unsigned int i = 0;
    struct Ov002Ent *e;
    char *base;
    int p = 1 - player;
    int off = (p & 1) * 0x868;
    if (*(unsigned int *)((char *)data_ov002_022cf180 + off) > i) {
        base = (char *)data_ov002_022cf16c + off;
        e = (struct Ov002Ent *)(base + 0x18 + 0x400);
        do {
            if (func_0202e234(e->id) != 0) {
                func_ov002_02253458(p, 14, i);
            }
            i++;
            e++;
        } while (i < *(unsigned int *)(base + 0x14));
    }
}
