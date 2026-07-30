extern int func_ov002_0223de48(void *self, int flag, int *outPtr);
extern int func_ov002_02257564(void *self, int a, int b);
extern int func_ov002_021de3e8(void *self, int a, int b);

int func_ov002_0220e428(void *self) {
    int buf;
    unsigned short half;
    int b0, b1;
    if (func_ov002_0223de48(self, 0, &buf) == 0) goto fail;
    half = (unsigned short)buf;
    b0 = buf & 0xff;
    b1 = (half >> 8) & 0xff;
    if (func_ov002_02257564(self, b0, b1) == 0) goto fail;
    if (func_ov002_021de3e8(self, b0, b1) != 0) return 1;
fail:
    return 0;
}
