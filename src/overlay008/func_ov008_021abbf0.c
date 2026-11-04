typedef struct {
    unsigned int w;
    unsigned short h;
} Cell;

extern int func_02005dac(int, int);
extern void func_020944a4(void *, int, int);

void func_ov008_021abbf0(int x, int y, int val, int z)
{
    Cell c;

    if (val > 9999999) {
        val = 9999999;
    }
    c.w = (y & 0xff) | 0x40000000 | ((x & 0x1ff) << 16);
    c.h = 0x692 | (z << 12);
    func_020944a4(&c, func_02005dac(2, 0), 8);
    x -= 14;
    do {
        c.w = (y & 0xff) | 0x40000000 | ((x & 0x1ff) << 16);
        c.h = ((val % 10) + 0x288) | 0x400 | (z << 12);
        func_020944a4(&c, func_02005dac(2, 0), 8);
        val /= 10;
        x -= 11;
    } while (val > 0);
}
