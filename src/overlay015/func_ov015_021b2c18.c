typedef struct {
    unsigned int a, b;
    unsigned char _pad8[0x14];
    struct { unsigned int low8:8; unsigned int:24; };
    unsigned char _pad20[4];
    struct { unsigned int:17; unsigned int mid4:4; unsigned int:11; };
} state_t;
extern state_t data_02102c90;
extern struct { unsigned int pad; unsigned int mode:3; unsigned int:29; } data_02104f4c;
extern int Ov015_SelectVramBank(int sel);
extern int func_0202c0c0(int);
extern int func_020054a4(int, int);
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02001d68(int arg);
extern void func_02001c98(unsigned int a, unsigned int b);
extern void func_02005088(int a0, int a1, int a2, int a3, int a4, int a5);
extern void func_ov015_021b30f0(int, const short *, int, int);

int func_ov015_021b2c18(int kind, int bank, const short *rect, int tile, int color) {
    int text;
    int w;
    int size;
    int width;
    int dst;
    int h;
    dst = Ov015_SelectVramBank(bank) + (tile << 5);
    w = rect[2];
    h = rect[3];
    size = 16;
    switch (kind) {
    case 1: text = func_0202c0c0(0x28b); break;
    case 2: text = func_0202c0c0(0x28c); break;
    case 3: text = func_0202c0c0(0x700); break;
    default: text = func_0202c0c0(0x28b); break;
    }
    for (;;) {
        switch (size) {
        default: size = 14; break;
        case 14: size = 12; break;
        case 12: size = 10; break;
        case 10: size = 8; break;
        case 8: return 0;
        }
        width = func_020054a4(text, size);
        if (width + 2 <= w << 3) break;
    }
    func_02001d0c(&data_02102c90, w, h);
    func_02001d68(data_02104f4c.mode);
    func_02001c98(15, 1);
    func_02005088((int)&data_02102c90, text, dst, ((w << 3) - width) >> 1, ((h << 3) - size) >> 1, size);
    func_ov015_021b30f0(bank, rect, tile, color);
    return 1;
}



