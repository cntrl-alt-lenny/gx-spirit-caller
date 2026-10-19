typedef struct {
    unsigned int tag;
    unsigned short param;
} Packed;
extern int func_02005dac(int a, int b);
extern asm void func_020944a4(void *buf, int handle, int count);
void func_ov008_021abba0(int a0, int a1) {
    Packed p;
    int handle;
    p.tag = (((unsigned int)(a0 - 2) << 23) >> 7) | (((unsigned int)(a1 - 2) & 0xff) | 0x80000000);
    p.param = 0x284;
    handle = func_02005dac(2, 0);
    func_020944a4(&p, handle, 8);
}
