extern int func_ov002_0223de48(void *self, int flag, int *outPtr);
extern unsigned short func_ov002_0223dda4(void *node, int idx);
extern int func_ov002_02257564(void *self, int a, int b);
extern int func_ov002_021d93bc(int a, int b, int c, int d);

int func_ov002_022394f8(void *self) {
    unsigned int result;
    unsigned short half;
    int b0, b1;

    if (func_ov002_0223de48(self, 0, 0) == 0) {
        goto fail;
    }
    result = func_ov002_0223dda4(self, 0);
    b0 = result & 0xff;
    half = (unsigned short)result;
    b1 = (half >> 8) & 0xff;
    if (func_ov002_02257564(self, b0, b1) == 0) {
        goto fail;
    }
    func_ov002_021d93bc(b0, b1, 1, 0x1a90);
fail:
    return 0;
}
