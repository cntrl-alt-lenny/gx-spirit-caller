/* func_ov006_021c5df0: configure two cell handles (engine 0 = "size 0x20",
 * engine 1 = "size 7"), both driven from the same self->f4c-selected table
 * row at self+0x6c (stride 0x10). Return 1. */
extern int  func_02021660(int a, int b, int c);
extern void func_020216b0(int h, int prop, int val);

int func_ov006_021c5df0(void *self_)
{
    char *self = (char *)self_;
    char *tbl;
    int mode;
    int h;
    int p0;
    int engine;
    int sz;
    int pD, p3, p4;

    mode = *(int *)(self + 0x4c);
    tbl = self + 0x6c;

    for (engine = 0; engine < 2; engine++) {
        sz = (engine == 0) ? 0x20 : 7;

        h = func_02021660(*(int *)self, 5, sz);

        if (*(int *)(self + 0x50) != 0 && *(int *)(tbl + mode * 16) >= 0
            && *(int *)(tbl + mode * 16) < 6) {
            if (engine == 0) {
                p0 = 0x1c1 + 0x28;
            } else {
                p0 = 0x1c1;
            }
        } else {
            p0 = 0;
        }

        if (engine == 0) {
            pD = 1;
            p3 = 8;
            p4 = *(int *)(tbl + mode * 16) * 0x16 + 0x1e;
        } else {
            pD = 0xc;
            p3 = 0xc;
            p4 = *(int *)(tbl + mode * 16) * 0x16 + 0x21;
        }

        func_020216b0(h, 2, sz);
        func_020216b0(h, 3, p3);
        func_020216b0(h, 4, p4);
        func_020216b0(h, 0x11, 3);
        func_020216b0(h, 0x12, 0);
        func_020216b0(h, 0xc, 0);
        func_020216b0(h, 0xd, pD);
        func_020216b0(h, 0, p0);
    }

    return 1;
}
