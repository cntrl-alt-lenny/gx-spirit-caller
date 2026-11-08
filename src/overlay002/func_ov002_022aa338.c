typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { union { u32 attr; struct { u32 y:8, rs:2, mode:2, rest:20; } bits; }; u16 tile; u16 pad; } Sprite;
extern char data_021040ac[];
extern struct { int pad; unsigned pad0:3; unsigned mode:2; } data_02104f4c;
extern int data_ov002_022cd73c[];
extern char data_ov002_022d0f2c[];
extern char data_ov002_022d0f98[];
extern int func_0207f05c(void *, const void *, int);
extern int func_ov002_021ca6f8(int idx);
void func_ov002_022aa338(void) {
    int digits[4];
    Sprite s;
    int xbase, ybase;
    int mode, offset, frames, seconds, minutes, blink;
    int i, x, y;
    if (*(int *)(data_021040ac + 0xbb0) == 0) return;
    mode = data_02104f4c.mode;
    s.attr = 0x80000000;
    s.tile = 0xc10f;
    if (mode % 2 != 0) { xbase = 0; offset = 2; }
    else { xbase = 0xe0; offset = 9; }
    ybase = 40 - (mode / 2) * 16;
    frames = *(int *)(data_021040ac + 0xbb4);
    seconds = frames / 60;
    if (frames <= 0 || *(int *)(data_021040ac + 0xb88) == 2) {
        digits[0] = digits[1] = digits[2] = digits[3] = -1;
    } else {
        minutes = seconds / 60;
        digits[0] = minutes / 10;
        if (digits[0] == 0) digits[0] = -1;
        digits[1] = minutes % 10;
        digits[2] = (seconds % 60) / 10;
        digits[3] = (seconds % 60) % 10;
        if (seconds < 60 && (*(int *)(data_021040ac + 0x38) & 8)) blink = 1;
        else blink = 0;
    }
    s.attr &= 0x3fff3fff;
    s.bits.mode = 0;
    s.tile = (s.tile & ~0xf000) | ((blink + 13) << 12);
    x = xbase + offset;
    y = ybase + 11;
    for (i = 0; i < 4; i++) {
        if (digits[i] >= 0) {
            s.tile = (s.tile & ~0x3ff) | ((digits[i] * 128 + 0x8980) / 128);
            s.attr = ((unsigned)((x + ((i >= 2 ? 1 : 0) << 1)) << 23) >> 7) | ((s.attr & 0xfe00ff00) | (y & 0xff));
            func_0207f05c(data_ov002_022d0f98, &s, 1);
        }
        x += 5;
    }
    frames = *(int *)(data_ov002_022d0f2c + 0xdc);
    if (frames < 0) frames = 0;
    seconds = frames / 60;
    digits[0] = -1;
    digits[1] = (seconds / 60) % 10;
    digits[2] = (seconds % 60) / 10;
    digits[3] = (seconds % 60) % 10;
    blink = 0;
    if (func_ov002_021ca6f8(data_ov002_022cd73c[1]) != 0) {
        int mask;
        if (seconds < 60) mask = 8;
        else mask = 0x20;
        blink = (*(int *)(data_021040ac + 0x38) & mask) > 0;
    }
    s.attr &= 0x3fff3fff;
    s.bits.mode = 0;
    s.tile = (s.tile & ~0xf000) | ((blink + 13) << 12);
    x = xbase + offset;
    y = ybase + 22;
    for (i = 0; i < 4; i++) {
        if (digits[i] >= 0) {
            s.tile = (s.tile & ~0x3ff) | ((digits[i] * 128 + 0x8980) / 128);
            s.attr = ((unsigned)((x + ((i >= 2 ? 1 : 0) << 1)) << 23) >> 7) | ((s.attr & 0xfe00ff00) | (y & 0xff));
            func_0207f05c(data_ov002_022d0f98, &s, 1);
        }
        x += 5;
    }
    s.tile = (s.tile & ~0x3ff) | 0x10f;
    s.attr = (s.attr & 0xfe00ff00) | (ybase & 0xff) | ((unsigned)(xbase << 23) >> 7);
    s.attr = ((s.attr & 0x3fff3fff) | 0x80000000) & ~0xc00;
    s.tile = (s.tile & ~0xf000) | 0xc000;
    func_0207f05c(data_ov002_022d0f98, &s, 1);
}

