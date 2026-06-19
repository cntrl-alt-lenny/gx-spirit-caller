/* func_ov002_0220043c: 021ff3bc-query predicate — require the query and a set
 * cf17c slot, bail if f2's 6-bit field isn't 0x23 while the cf288 slot's bit16
 * is set, else accept. */

struct Func0220052cF2 {
    unsigned short bit0 : 1;
    unsigned short pad1 : 5;
    unsigned short field6 : 6;
    unsigned short rest : 4;
};

struct Func0220052cSelf {
    unsigned short pad0;
    struct Func0220052cF2 f2;
};

extern int func_ov002_021ff2cc(struct Func0220052cSelf *self);
extern char data_ov002_022cf09c[];
extern char data_ov002_022cf1a8[];

int func_ov002_0220043c(struct Func0220052cSelf *self) {
    int off;
    if (func_ov002_021ff2cc(self) == 0)
        return 0;
    off = (self->f2.bit0 & 1) * 0x868;
    if (*(int *)(data_ov002_022cf09c + off) == 0)
        return 0;
    if (self->f2.field6 != 0x23
        && ((*(unsigned int *)(data_ov002_022cf1a8 + off) >> 16) & 1))
        return 0;
    return 1;
}
