typedef struct {
    unsigned int attr;
    unsigned short tile;
} Sprite;
extern void *func_02005dac(int engine, int slot);
extern void func_020944a4(void *src, void *dst, int n);
void func_ov016_021b2a8c(int x, int y, int tile, int palette, int width) {
    Sprite sprite;
    int count = width / 32;
    int i;
    for (i = 0; i < count; i++) {
        sprite.attr = (y & 0xff) | 0x80004000 | ((x & 0x1ff) << 16);
        sprite.tile = tile | 0x800 | (palette << 12);
        func_020944a4(&sprite, func_02005dac(2, 0), 6);
        x += 32;
        tile += 2;
    }
}
