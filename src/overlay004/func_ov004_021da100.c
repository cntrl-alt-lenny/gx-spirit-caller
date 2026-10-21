typedef struct { unsigned int attr; unsigned short tile; } Sprite;
extern Sprite *func_02005dac(int kind, int slot);
void func_ov004_021da100(int x, int y, int tile, int pal, int width) {
    int i;
    Sprite sprite;
    for (i = 0; i < width / 32; i++) {
        sprite.attr = (y & 0xff) | 0x80004000 | ((unsigned int)(x & 0x1ff) << 16);
        sprite.tile = (((tile * width << 4) / 2 + 0xc80 + (i * 512) / 2) / 128) | 0x800 | (pal << 12);
        *func_02005dac(2, 0) = sprite;
        x += 32;
    }
}
