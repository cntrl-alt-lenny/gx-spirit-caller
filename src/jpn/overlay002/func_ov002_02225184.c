extern int func_ov002_0223de48(void *a, int b, int c);
extern int func_ov002_0223dda4(void *self, int arg1);
extern int func_ov002_02257564(void *a0, int a1, int a2);
extern int func_ov002_021d58dc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);

int func_ov002_02225184(unsigned short *a0) {
    int r;
    int byte0, byte1;

    if (func_ov002_0223de48(a0, 0, 0) == 0) {
        goto done;
    }
    r = func_ov002_0223dda4(a0, 0);
    byte0 = r & 0xff;
    byte1 = ((unsigned short)r >> 8) & 0xff;
    if (func_ov002_02257564(a0, byte0, byte1) == 0) {
        goto done;
    }
    func_ov002_021d58dc(byte0, byte1, *a0, 3, 0);
done:
    return 0;
}
