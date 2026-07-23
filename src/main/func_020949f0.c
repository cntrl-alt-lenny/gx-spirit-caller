typedef struct {
    int f0;
    int f4;
    unsigned short f8;
    unsigned char fa;
    unsigned char fb;
    unsigned char fc;
    unsigned char fd;
    unsigned char fe;
} T_020949f0;

void func_020949f0(T_020949f0 *p, int a1, int *a2) {
    p->f0 = a1;
    p->f4 = (unsigned int)*a2 >> 8;
    p->fb = 0;
    p->fc = 0;
    p->fd = 0;
    p->fe = 0;
    p->f8 = 0;
    p->fa = 0;
}
