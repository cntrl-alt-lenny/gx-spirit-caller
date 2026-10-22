extern void func_0208c884(unsigned short *a0, int a1);
extern int func_ov005_021ae5a4(int *p);
int func_ov005_021ad284(int *p) {
    int ret = 0;
    switch (p[0]) {
    case 0:
        p[3]++;
        func_0208c884((unsigned short *)0x0400006c, p[3] - 16);
        func_0208c884((unsigned short *)0x0400106c, p[3] - 16);
        if (p[3] >= 16) {
            p[0] = 1;
            p[3] = 0;
        }
        break;
    case 1:
        if (func_ov005_021ae5a4(p)) {
            p[0] = 2;
            p[3] = 0;
        }
        break;
    case 2:
        p[3]++;
        func_0208c884((unsigned short *)0x0400006c, -p[3]);
        func_0208c884((unsigned short *)0x0400106c, -p[3]);
        if (p[3] >= 16) ret = 1;
        break;
    }
    return ret;
}
