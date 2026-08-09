extern int func_020442d0(void *p);
extern int func_020a7440(const void *p1, const void *p2, int n);
extern int func_02044228(void *p);
extern void func_020442f8(int a0, void *out);
extern int func_02044254(void *p, void *buf);
extern char data_020bece4[];

int func_020447d8(void *self) {
    char buf[8];
    unsigned char b;

    b = *(unsigned char *)((char *)self + 0xe7);
    if (b == 0xff) {
        return 1;
    }
    if (b > 2) {
        return 0;
    }
    if (func_020442d0((char *)self + 0x40) == 0) {
        return 0;
    }
    if (func_020a7440((char *)self + 0xc0, data_020bece4 + 0x38, 4) != 0) {
        if (func_02044228((char *)self + 0xc4) == 0) {
            return 0;
        }
        b = *(unsigned char *)((char *)self + 0xd0);
        if (b > 0x20) {
            return 0;
        }
        func_020442f8(b, buf);
        if (func_02044254((char *)self + 0xc0, buf) == 0) {
            return 0;
        }
    }
    if (func_020a7440((char *)self + 0xc8, data_020bece4 + 0x38, 4) != 0) {
        if (func_02044228((char *)self + 0xc8) == 0) {
            if (func_02044228((char *)self + 0xcc) == 0) {
                return 0;
            }
        }
    }
    return 1;
}
