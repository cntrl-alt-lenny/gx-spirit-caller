/* func_ov002_02206b88: C-39d 021ca2b8 predicate — three guards on self->f2.bit0:
 * require 021ca2b8(bit0), require 021ca3f0(bit0, 0x1670), then report
 * 021ff2b8(self, 1 - bit0) >= 3. */

struct Func02206b88F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct Func02206b88Self {
    unsigned short pad0;
    struct Func02206b88F2 f2;
};

extern int func_ov002_021ca2b8(unsigned int bit);
extern int func_ov002_021ca3f0(unsigned int bit, int code);
extern int func_ov002_021ff2b8(struct Func02206b88Self *self, int v);

int func_ov002_02206b88(struct Func02206b88Self *self) {
    if (func_ov002_021ca2b8(self->f2.bit0) == 0)
        return 0;
    if (func_ov002_021ca3f0(self->f2.bit0, 0x1670) == 0)
        return 0;
    return func_ov002_021ff2b8(self, 1 - self->f2.bit0) >= 3;
}
