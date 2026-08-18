extern int func_ov002_0223df38(void *a, int b, int c);
extern int func_ov002_0223de94(void *self, int arg1);
extern int func_ov002_0225764c(void *a0, int a1, int a2);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);

int func_ov002_02225274(unsigned short *a0) {
    int r;
    int byte0, byte1;

    if (func_ov002_0223df38(a0, 0, 0) == 0) {
        goto done;
    }
    r = func_ov002_0223de94(a0, 0);
    byte0 = r & 0xff;
    byte1 = ((unsigned short)r >> 8) & 0xff;
    if (func_ov002_0225764c(a0, byte0, byte1) == 0) {
        goto done;
    }
    func_ov002_021d59cc(byte0, byte1, *a0, 3, 0);
done:
    return 0;
}
