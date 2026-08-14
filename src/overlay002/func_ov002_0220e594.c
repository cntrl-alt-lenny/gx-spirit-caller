typedef unsigned short u16;

struct Self {
    char _pad0[6];
    struct {
        u16 lo : 8;
        u16 hi : 8;
    } f6;
};

extern int func_ov002_0223df38(void *self, int i, int *out);
extern int func_ov002_0225764c(void *self, int a, int b);
extern int func_ov002_021c2084(void *self, int a, int b, int d);
extern int func_ov002_021de408(void *self, int mask);

/* func_ov002_0220e594: same func_ov002_022123fc mask-accumulate family
 * shape, but bounded by self's field6 LOW byte (not a fixed count) and
 * with an extra constant-1 4th arg to func_ov002_021c2084; result is
 * forwarded from func_ov002_021de408(self, mask). */
int func_ov002_0220e594(struct Self *self) {
    int mask = 0;
    int i;
    int out;

    for (i = 0; i < self->f6.lo; i++) {
        if (func_ov002_0223df38(self, i, &out) != 0) {
            int lo = out & 0xff;
            int hi = ((u16)out >> 8) & 0xff;
            if (func_ov002_0225764c(self, lo, hi) != 0) {
                if (func_ov002_021c2084(self, lo, hi, 1) != 0)
                    mask |= 1 << (hi + (lo << 4));
            }
        }
    }

    return func_ov002_021de408(self, mask);
}
