typedef struct {
    unsigned int tag;
    unsigned short param;
} Packed;
extern void *func_02005dac(int a, int b);
extern void func_020944a4(const void *src, void *dst, int size);
extern void func_ov008_021ab484(int x, int y, int row, int col, int cell, int scale, int priority, int mode);
void func_ov008_021ac718(int x, int y, int value, int variant) {
    func_ov008_021ab484(x, y, 0, 0, variant + 0x19, 2, 0x400, 0);
    x += 15;
    {
        unsigned int row = (unsigned char)(y + 1);
        int base = variant * 10 + 0x242;
        Packed p;
        do {
            p.tag = (((unsigned int)x << 23) >> 7) | row;
            p.param = value % 10 + base;
            func_020944a4(&p, func_02005dac(2, 0), 8);
            value /= 10;
            x -= 5;
        } while (value > 0);
    }
}

