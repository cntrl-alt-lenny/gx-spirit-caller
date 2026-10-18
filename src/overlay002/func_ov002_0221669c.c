extern int func_ov002_0223df38(void *self, int flag, int *outPtr);
extern int func_ov002_0225764c(void *self, int a, int b);
extern int func_ov002_021d5a08(void *self, int a, int b, int c, int d, int e);

int func_ov002_0221669c(void *self) {
    int buf;
    unsigned short half;
    int b0, b1;
    if (func_ov002_0223df38(self, 0, &buf) != 0) {
        half = (unsigned short)buf;
        b0 = buf & 0xff;
        b1 = (half >> 8) & 0xff;
        if (func_ov002_0225764c(self, b0, b1) != 0) {
            func_ov002_021d5a08(self, b0, b1, *(unsigned short *)self, 2, 0);
        }
    }
    return 0;
}
