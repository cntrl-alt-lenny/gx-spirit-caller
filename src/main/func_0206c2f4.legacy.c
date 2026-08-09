extern int func_0206e468(unsigned short v);
extern int func_0206c2c0(void *p);

int func_0206c2f4(void *self) {
    int acc = 0x80;
    unsigned short h;

    h = *(unsigned short *)((char *)self + 0x2);
    if (h != 0) {
        acc += 0x114;
        acc += func_0206e468(h);
        h = *(unsigned short *)((char *)self + 0x8);
        acc += func_0206e468(h);
        acc += func_0206c2c0((char *)self + 0x10);
    }
    h = *(unsigned short *)((char *)self + 0x6);
    if (h != 0) {
        acc += 0x110;
        acc += func_0206e468(h);
        h = *(unsigned short *)((char *)self + 0xa);
        acc += func_0206e468(h);
        h = *(unsigned short *)((char *)self + 0xc);
        acc += func_0206e468(h);
        acc += func_0206c2c0((char *)self + 0x14);
    }
    return acc;
}
