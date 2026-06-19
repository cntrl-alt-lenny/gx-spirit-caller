/* func_ov002_02208708: 021ff3bc-query predicate — require 021b3ecc(bit0, 11,
 * f0) and the cf17c per-player count slot, then return the 021ff3bc(self,
 * arg1) query. */

struct Func022087f8F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct Func022087f8Self {
    unsigned short f0;
    struct Func022087f8F2 f2;
};

extern int func_ov002_021b3dec(unsigned int bit, int kind, unsigned int f0);
extern char data_ov002_022cf09c[];
extern int func_ov002_021ff2cc(struct Func022087f8Self *self, int arg1);

int func_ov002_02208708(struct Func022087f8Self *self, int arg1) {
    if (func_ov002_021b3dec(self->f2.bit0, 11, self->f0) == 0)
        return 0;
    if (*(int *)(data_ov002_022cf09c + (self->f2.bit0 & 1) * 0x868) == 0)
        return 0;
    return func_ov002_021ff2cc(self, arg1);
}
