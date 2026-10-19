extern void *func_02005dac(int a, int b);
extern void func_020944a4(const void *src, void *dst, int size);

typedef struct {
    unsigned int attr;
    unsigned short tile;
} SpriteEntry;

void func_ov016_021b6074(int x, int y, int palette, int tile) {
    SpriteEntry entry;
    entry.attr = (((unsigned int)(x - 13) & 0x1ff) << 16) | (((y + 2) & 0xff) | 0x40000000);
    entry.tile = (tile + 0x2dc) | (palette << 10) | 0x5000;
    func_020944a4(&entry, func_02005dac(2, 0), 6);
}
