typedef struct {
    unsigned int tag;
    unsigned short param;
} Packed;
extern int func_02005dac(int a, int b);
extern asm void func_020944a4();
void func_ov008_021ac658(int x, int y, int value) {
    Packed p;
    int digit;


    do {
        p.tag = (((unsigned int)x << 23) >> 7) | (y & 0xff);
        p.param = value % 10 + 0x260;
        func_020944a4(&p, func_02005dac(2, 0), 8);
        if (value % 10 == 4) x--;
        value = value / 10;
        x -= 6;
        if (value % 10 == 4) x--;
        else if (value % 10 == 1) x++;
    } while (value > 0);
}









