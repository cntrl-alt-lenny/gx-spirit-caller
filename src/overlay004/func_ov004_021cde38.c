typedef struct { unsigned int attr; unsigned short tile; } Sprite;
extern Sprite *func_02005dac(int kind, int slot);
void func_ov004_021cde38(int x, int y, int tile) {
    int i;
    Sprite sprite;
    for (i = 0; i < 4; i++) {
        sprite.attr = (y & 0xff) | 0x80004000 | ((unsigned int)(x & 0x1ff) << 16);
        sprite.tile = ((tile << 11) / 2 + 0x400 + (i << 9) / 2) / 128 | 0x8000;
        *func_02005dac(1, 0) = sprite;
        x += 32;
    }
}
