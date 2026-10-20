typedef struct {
    unsigned int a, b;
    unsigned char pad8[0x14];
    struct { unsigned int low8:8; unsigned int:24; };
    unsigned char pad20[4];
    struct { unsigned int:17; unsigned int mid4:4; unsigned int:11; };
} state_t;
typedef struct { short x, y, width, height; } Rect;
typedef struct { unsigned int pad; unsigned int mode:3; unsigned int:29; } Flags;
extern state_t data_02102c90;
extern Flags data_02104f4c;
extern int func_ov010_021b2b08(int which);
extern int func_0202c0c0(int id);
extern int func_020054a4(int text, int size);
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02001d68(int arg);
extern void func_02001c98(unsigned int a, unsigned int b);
extern void func_02005088(int a0, int a1, int a2, int a3, int a4, int a5);
extern void func_ov010_021b35e4(int which, Rect *rect, int tile, int palette);
int func_ov010_021b2c18(int kind, int which, Rect *rect, int tile, int palette) {
    int text;
    int width;
    int size;
    int dest = func_ov010_021b2b08(which) + (tile << 5);
    width = rect->width;
    int height = rect->height;
    size = 16;
    int length;
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
        length = func_020054a4(text, size);
        if (length + 2 <= (width << 3)) break;
    }
    func_02001d0c(&data_02102c90, width, height);
    func_02001d68(data_02104f4c.mode);
    func_02001c98(15, 1);
    func_02005088((int)&data_02102c90, text, dest, ((width << 3) - length) >> 1, ((height << 3) - size) >> 1, size);
    func_ov010_021b35e4(which, rect, tile, palette);
    return 1;
}



