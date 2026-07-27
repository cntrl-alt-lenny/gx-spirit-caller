extern int func_ov002_0223df38(void *self, int flag, int *outPtr);
extern int func_ov002_0225764c(void *self, int a, int b);
extern int func_ov002_021de4d8(void *self, int a, int b);

int func_ov002_0220e518(void *self) {
    int buf;
    unsigned short half;
    int b0, b1;
    if (func_ov002_0223df38(self, 0, &buf) == 0) goto fail;
    half = (unsigned short)buf;
    b0 = buf & 0xff;
    b1 = (half >> 8) & 0xff;
    if (func_ov002_0225764c(self, b0, b1) == 0) goto fail;
    if (func_ov002_021de4d8(self, b0, b1) != 0) return 1;
fail:
    return 0;
}
