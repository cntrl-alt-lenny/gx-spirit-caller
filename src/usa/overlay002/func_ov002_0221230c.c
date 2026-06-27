
typedef unsigned short u16;
extern int  func_ov002_0223de48(void *self, int i, int *out);
extern int  func_ov002_02257564(void *self, int a, int b);
extern int  func_ov002_021de318(void *self, int mask);
int func_ov002_0221230c(void *self) {
    int i;
    int out;
    int mask = 0;
    for (i = 0; i < 2; i++) {
        if (func_ov002_0223de48(self, i, &out) != 0) {
            int lo = out & 0xff;
            int hi = ((u16)out >> 8) & 0xff;
            if (func_ov002_02257564(self, lo, hi) != 0)
                mask |= 1 << (hi + (lo << 4));
        }
    }
    func_ov002_021de318(self, mask);
    return 0;
}
