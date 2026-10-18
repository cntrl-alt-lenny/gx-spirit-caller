#include "ov002_core.h"

struct Slot0223aa68 {
    u16 id;
    u16 b0 : 1;
    u16 idx5 : 5;
    u16 _rest2 : 10;
    u16 _fbit0 : 1;
    u16 bit1 : 1;
    u16 bit2 : 1;
    u16 bit3 : 1;
    u16 _pad45 : 2;
    u16 val9 : 9;
    u16 _pad15 : 1;
    char _pad[0x12];
};

struct Self0223aa68 {
    char _pad[2];
    u16 b0 : 1;
};

extern struct Slot0223aa68 data_ov002_022ce588[];
extern int IsValue12D3Or147E(int a0);
extern void func_ov002_021d8904(int player, int idx, int value);
extern int func_ov002_021de598(int arg0, int arg1, int arg2);
extern void func_ov002_0226b13c();

int func_ov002_0223aa68(struct Self0223aa68 *self) {
    int i = CE288->f_484 - 1;
    struct Slot0223aa68 *s;
    if (i >= 0) {
        s = &data_ov002_022ce588[i];
        do {
            if (IsValue12D3Or147E(s->id) == 0) {
                s->bit1 = 1;
                s->bit2 = s->bit1;
                s->bit3 = s->bit2;
                func_ov002_021d8904(s->b0, s->idx5, s->val9);
                if (s->idx5 <= 0xa) {
                    func_ov002_021de598((int)self, s->b0, s->idx5);
                }
            }
            s--;
        } while (--i >= 0);
    }
    func_ov002_0226b13c(1 - self->b0, CE288->f_484);
    return 0;
}
