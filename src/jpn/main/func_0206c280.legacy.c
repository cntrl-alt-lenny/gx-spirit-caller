extern int func_0206e3f4(unsigned short v);
extern int func_0206c24c(void *p);

int func_0206c280(void *self) {
    int acc = 0x80;
    unsigned short h;

    h = *(unsigned short *)((char *)self + 0x2);
    if (h != 0) {
        acc += 0x114;
        acc += func_0206e3f4(h);
        h = *(unsigned short *)((char *)self + 0x8);
        acc += func_0206e3f4(h);
        acc += func_0206c24c((char *)self + 0x10);
    }
    h = *(unsigned short *)((char *)self + 0x6);
    if (h != 0) {
        acc += 0x110;
        acc += func_0206e3f4(h);
        h = *(unsigned short *)((char *)self + 0xa);
        acc += func_0206e3f4(h);
        h = *(unsigned short *)((char *)self + 0xc);
        acc += func_0206e3f4(h);
        acc += func_0206c24c((char *)self + 0x14);
    }
    return acc;
}
