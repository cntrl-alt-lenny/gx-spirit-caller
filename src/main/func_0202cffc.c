typedef struct {
    unsigned int a, b;
    unsigned char _pad8[0x14];
    struct { unsigned int low8:8; unsigned int:24; };
    unsigned char _pad20[4];
    struct { unsigned int:17; unsigned int mid4:4; unsigned int:11; };
} state_t;
typedef struct {
    int f0, f4, f8, fc, f10;
    char pad[0x54];
    int f68;
} Context;
typedef struct { int f0; unsigned int mode:3; unsigned int:29; } Flags;
extern Context data_0219ad48;
extern state_t data_02102c90;
extern Flags data_02104f4c;
extern int func_0201d530(int sel);
extern int func_0201d4b4(int sel);
extern void func_02094504(int value, void *dest, unsigned int count);
extern void func_02094550(int *src, int *dst, unsigned int count);
extern void func_02001d0c(state_t *p, int a, int b);
extern int *func_0202b1a8(int a);
extern int func_0202b100(int a0);
extern void func_0202ce78(signed char *p, int a, int x, int y, int spacing);
extern void func_02005088(int a0, int a1, int a2, int a3, int a4, int a5);
void func_0202cffc(void) {
    unsigned short tiles[3][32];
    int base;
    int n;
    int y;
    int x;
    base = func_0201d530(data_0219ad48.f68);
    func_02094504(0, (void *)func_0201d4b4(data_0219ad48.f68), 0xc0);
    func_02094504(0, (void *)(base + 0x220), 0x1800);
    func_02001d0c(&data_02102c90, 0x40, 3);
    if (data_02104f4c.mode == 0) {
        func_0202ce78((signed char *)func_0202b1a8(data_0219ad48.f4), base + 0x220, 1, 1, 12);
    } else {
        func_02005088((int)&data_02102c90, func_0202b100(data_0219ad48.f4), base + 0x220, 1, 6, 12);
    }
    data_0219ad48.f8 = (*(int *)((char *)&data_02102c90 + 8) + 6) & ~7;
    n = 0;
    if (data_0219ad48.f8 <= data_0219ad48.fc) {
        n = ((data_0219ad48.fc - data_0219ad48.f8) / 8) / 2;
    }
    for (y = 0; y < 3; y++) {
        for (x = 0; x < 32; x++) {
            unsigned short tile;
            if (x < n) tile = 0;
            else tile = 17 + y * 64 + (x - n);
            tiles[y][x] = tile;
        }
    }
    func_02094550((int *)tiles, (int *)func_0201d4b4(data_0219ad48.f68), 0xc0);
    data_0219ad48.f10 = 0;
}
