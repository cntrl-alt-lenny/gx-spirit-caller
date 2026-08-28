/* func_ov002_02216244: gated variant of the func_ov002_022123fc family
 * (same func_ov002_0223de48/func_ov002_02257564 mask-accumulate shape,
 * "DECL-ORDER: i+out before mask" + "(u16)out>>8 3-shift" recipe). Only
 * runs when self's field6 top byte == 3 (also the loop bound); after the
 * loop, gates the final func_ov002_021de318(self, mask) dispatch on
 * func_ov002_021b4538(mask) == 3. */
typedef unsigned short u16;

struct Self {
    char _pad0[6];
    struct {
        unsigned short lo : 8;
        unsigned short hi : 8;
    } f6;
};

extern int func_ov002_0223de48(void *self, int i, int *out);
extern int func_ov002_02257564(void *self, int a, int b);
extern int func_ov002_021b4538(int a);
extern int func_ov002_021de318(void *self, int mask);

int func_ov002_02216244(struct Self *self) {
    int i;
    int out;
    int mask;

    if (self->f6.hi != 3)
        goto tail;

    mask = 0;
    for (i = 0; i < self->f6.hi; i++) {
        if (func_ov002_0223de48(self, i, &out) != 0) {
            int lo = out & 0xff;
            int hi = ((u16)out >> 8) & 0xff;
            if (func_ov002_02257564(self, lo, hi) != 0)
                mask |= 1 << (hi + (lo << 4));
        }
    }

    if (func_ov002_021b4538(mask) == 3)
        func_ov002_021de318(self, mask);

tail:
    return 0;
}
