extern int func_ov002_0223df38(void *self, int i, int *out);
extern int func_ov002_0225764c(void *self, int a, int b);
extern int func_ov002_021de910(void *self, int a, int b);

int func_ov002_02212b58(void *self) {
    int v;
    int a;
    int b;
    if (func_ov002_0223df38(self, 0, &v)) {
        a = v & 0xff;
        b = ((unsigned short)v >> 8) & 0xff;
        if (func_ov002_0225764c(self, a, b)) {
            func_ov002_021de910(self, a, b);
        }
    }
    return 0;
}
