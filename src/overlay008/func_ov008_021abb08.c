typedef struct {
    unsigned int tag;
    unsigned short param;
} Packed;

extern int func_02005dac(int a, int b);
extern void func_020944a4(void *buf, int handle, int count);

void func_ov008_021abb08(int a0, int a1) {
    unsigned int shifted = (unsigned int)(a0 - 1) << 23;
    Packed p;
    int handle;

    p.tag = (((unsigned int)(a1 - 1) & 0xff) | 0x80000000) | (shifted >> 7);
    p.param = 0x27e;
    handle = func_02005dac(2, 0);
    func_020944a4(&p, handle, 8);

    p.tag = ((((unsigned int)a1 + 0x1f) & 0xff) | 0x4000 | 0x80000000) | (shifted >> 7);
    p.param = 0x282;
    handle = func_02005dac(2, 0);
    func_020944a4(&p, handle, 8);
}
