typedef struct { unsigned int attr01; unsigned short attr2; unsigned short pad; } Sprite;
extern Sprite *func_02005dac(int, int);
void func_ov004_021cfd6c(int x, int y, int n) {
    Sprite obj;
    int i;
    for (i = 0; i < 6; i++) {
        obj.attr01 = ((y & 255) | 0x80004000) | ((x & 511) << 16);
        obj.attr2 = (((((n * 3) << 10) / 2 + 128) + (i * 512) / 2) / 128) | 0x2000;
        *func_02005dac(2, 0) = obj;
        x += 32;
    }
}
