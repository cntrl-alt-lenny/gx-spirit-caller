typedef unsigned short u16;

extern int func_ov002_0223df38(void *self, int i, int *out);
extern int func_ov002_0225764c(void *self, int a, int b);
extern int func_ov002_021de64c(void *self, int a, int b, int c);

int func_ov002_0222a960(void *self) {
    int out;

    if (func_ov002_0223df38(self, 0, &out) != 0) {
        int lo = out & 0xff;
        int hi = ((u16)out >> 8) & 0xff;
        if (func_ov002_0225764c(self, lo, hi) != 0) {
            func_ov002_021de64c(self, lo, hi, 0);
        }
    }
    return 0;
}
