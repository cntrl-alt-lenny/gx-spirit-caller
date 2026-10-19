typedef struct { int f0, f4, f8, fc; } Req;
typedef struct { int f0, f4; } Out;
extern void func_0201ef90(int *, int *, int *, int, int, int, Req *, int, int, Out *);
void func_ov003_021cd358(char *base, int side, int slot, Req *req) {
    int value;
    int select;
    int tile;
    switch (slot) {
    default: case 0: value = 0xc0; break;
    case 1: value = 0x180; break;
    case 2: value = 0x200; break;
    case 3: value = 0x300; break;
    case 4: value = 0x380; break;
    }
    tile = slot + 1;
    if (side != 0) select = 1; else select = 2;
    func_0201ef90((int *)(base + 0x190 + side * 0x1b8 + slot * 4),
        (int *)(base + 0x1a4 + side * 0x1b8 + slot * 4),
        (int *)(base + 0x1b8 + side * 0x1b8 + slot * 0x48),
        value << 7, tile << 9, select, req, 1, 0x200,
        (Out *)(base + 0x320 + side * 0x1b8 + slot * 8));
}


