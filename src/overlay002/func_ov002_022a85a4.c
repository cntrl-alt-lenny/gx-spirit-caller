typedef unsigned int u32;
typedef struct { u32 attr; unsigned short tile, pad; } Sprite;
extern struct { int f0; u32 :3; u32 mode:2; u32 :27; } data_02104f4c;
extern unsigned char data_ov002_022d0f98[];
extern int func_0207f05c(void *, const void *, int);
void func_ov002_022a85a4(char *self) {
    Sprite s;
    int frame, y, x, tile, mode;
    frame = *(int *)(self + 0x584);
    if (frame <= 30) return;
    tile = (0xc980 + ((frame / 32 % 4) << 10)) / 128;
    mode = (int)data_02104f4c.mode;
    y = (mode / 2 == 0) * 16;
    x = 224 - (mode % 2 ? 24 : 0);
    s.attr = ((x & 511) << 16) | ((y & 255) | 0x2000 | 0x80000000);
    s.tile = tile | 0x3000;
    func_0207f05c(data_ov002_022d0f98, &s, 1);
}




