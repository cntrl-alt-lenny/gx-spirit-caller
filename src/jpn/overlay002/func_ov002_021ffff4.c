/* func_ov002_021ffff4: C-39d 021ca2b8 predicate — require 021ca2b8(bit0),
 * then report the cf178 per-player count slot nonzero. */

struct Func022000e4F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct Func022000e4Self {
    unsigned short pad0;
    struct Func022000e4F2 f2;
};

extern int func_ov002_021ca1d8(unsigned int bit);
extern char data_ov002_022cf098[];

int func_ov002_021ffff4(struct Func022000e4Self *self) {
    if (func_ov002_021ca1d8(self->f2.bit0) == 0)
        return 0;
    return *(int *)(data_ov002_022cf098 + (self->f2.bit0 & 1) * 0x868) != 0;
}
