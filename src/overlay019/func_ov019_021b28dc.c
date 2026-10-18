typedef struct {
    unsigned int attr;
    unsigned short tile;
} Sprite;
extern void *func_02005dac(int engine, int index);
extern void func_020944a4(const void *src, void *dst, unsigned int size);
void func_ov019_021b28dc(int x, int y, int flags, int tile, int palette) {
    Sprite sprite;
    sprite.attr = (((unsigned int)(x - 13) & 0x1ff) << 16) | ((unsigned char)(y + 2) | 0x40000000);
    sprite.tile = (tile + 0x3a8) | (flags << 10) | (palette << 12);
    func_020944a4(&sprite, func_02005dac(2, 0), 6);
}
