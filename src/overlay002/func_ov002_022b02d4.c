extern int data_02104f4c[];
extern const int data_ov002_022ca510[];
extern unsigned char data_ov002_022d0f98[];
extern int func_0207f05c(void *, const void *, int);
typedef struct { unsigned int attr; unsigned short tile; unsigned short pad; } Sprite;
void func_ov002_022b02d4(int *arg) {
    Sprite s;
    int field;
    int x;
    int y;
    int i;
    int tile;
    s.attr = 0x80002000;
    s.tile = 0x1400;
    field = (unsigned)(data_02104f4c[1] << 27) >> 30;
    x = field % 2 ? 0xe7 : 0;
    y = field / 2 ? 0 : 0x10;
    for (i = 0; i < 6; i++) {
        s.attr = (s.attr & 0xfe00ff00) | (y & 0xff) | ((x & 0x1ff) << 16);
        if (i == arg[2]) s.tile = (s.tile & ~0x3ff) | 0x60;
        else if (i == arg[1]) s.tile = (s.tile & ~0x3ff) | 0x58;
        else s.tile = (s.tile & ~0x3ff) | ((0x1400 + i * 0x400) / 128);
        func_0207f05c(data_ov002_022d0f98, &s, 1);
        y += data_ov002_022ca510[i];
    }
}

