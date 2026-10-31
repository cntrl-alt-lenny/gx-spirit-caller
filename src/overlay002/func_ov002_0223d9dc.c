#include "ov002_core.h"
struct CardD9 { unsigned id:13; unsigned flag:1; unsigned rest:8; unsigned number:8; unsigned end:2; };
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int player, int phase, int card, int arg);
extern int *func_ov002_021afb74(void);
extern int func_ov002_0223bdb8(struct Ov002Self *self);
extern int func_ov002_0223be40(struct Ov002Self *self, int arg1);
int func_ov002_0223d9dc(struct Ov002Self *self, int arg1) {
    unsigned short flags = *(unsigned short *)((char *)self + 2);
    unsigned player = self->b0 ^ ((unsigned)(flags << 17) >> 31);
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (func_ov002_0223bdb8(self) == 0) return 0;
        func_ov002_021ae400(self->b0, 0x5b);
        return 0x7f;
    case 0x7f:
        func_ov002_021af9d0(player, 6, self->f0, 0);
        return 0x7e;
    case 0x7e:
        *(int *)(data_ov002_022ce288 + 0x69c) = ((struct CardD9 *)func_ov002_021afb74())->id;
        {
            struct CardD9 *card = (struct CardD9 *)func_ov002_021afb74();
            *(int *)(data_ov002_022ce288 + 0x6a0) = ((struct CardD9 *)func_ov002_021afb74())->number * 2 + card->flag;
        }
        *(int *)(data_ov002_022ce288 + 0x6a4) = 0;
        *(int *)(data_ov002_022ce288 + 0x6b0) = 0;
        *(int *)(data_ov002_022ce288 + 0x6ac) = 0;
        *(int *)(data_ov002_022ce288 + 0x6b4) = 0;
        return 0x63;
    default:
        return func_ov002_0223be40(self, arg1);
    }
}


