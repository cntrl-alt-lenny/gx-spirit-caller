typedef struct { int scale; int mode; int unused[2]; void *entry; } Record;
extern void func_ov004_021ca0a4(Record *self, int a, int x, int y, void *p, int index);
extern void func_ov004_021d705c(int x, int y, int tile, int pal, int width);
extern void func_ov004_021d7118(int x, int y, int width, int height);
typedef struct { char pad[0x54]; int state, transition, unused, flag; char pad64[0x2c]; int selected, u94, u98, active; char pada0[0x3bf4]; int choices[4]; char rest[0x2300]; } State;
extern State data_ov004_0220b500;
extern char data_021040ac[];
void func_ov004_021d7564(void) {
    char *base = (char *)&data_ov004_0220b500;
    int left;
    char *entry;
    int offset = 0;
    int x, y, z, i, index;

    switch (*(int *)(base + 0x54)) {
    case 5:
        offset = *(int *)(base + 0x58);
        if (offset < 0) offset = -offset;
        offset = 256 - offset;
        break;
    case 6:
        if (*(int *)(base + 0x60) == 0) {
            if (*(int *)(base + 0x90) < 4)
                func_ov004_021d7118(4, *(int *)(base + 0x90) * 35 + 8, 198, 32);
            else
                func_ov004_021d7118(24, 150, 158, 24);
        }
        break;
    default: return;
    }
    if (offset >= 192) return;
    left = 5 - offset;
    x = 39 - offset;
    for (i = 0, y = 10, z = 9; i < 4; y += 35, z += 35, i++) {
        func_ov004_021d705c(x, y, i, 2, 128);
        func_ov004_021d705c(x, y + 16, i + 5, 3, 128);
        index = ((State *)base)->choices[i] + ((i + (i > 0)) * 2 + 18);
        if (i == 1) {
            if (((State *)base)->choices[i] != 0) index = 20;
            else index = *(int *)(data_021040ac + 0x34) + 21;
        }
        entry = base + (unsigned int)i * 4 + 0x3ca4;
        func_ov004_021ca0a4((Record *)(base + 0x5f90), 2, x + 48 - *(int *)(entry + 0x14) / 2, y + 13, (void *)2, index);
        func_ov004_021ca0a4((Record *)(base + 0x5f90), 2, x + 64 + *(int *)(entry + 0x14) / 2, y + 13, (void *)2, index);
        if (i == *(int *)(base + 0x90) && *(int *)(base + 0x9c) != 0) {
            if (*(int *)(base + 0x9c) < 0)
                func_ov004_021ca0a4((Record *)(base + 0x5f90), 2, left, z, (void *)2, 14);
            else
                func_ov004_021ca0a4((Record *)(base + 0x5f90), 2, 182 - offset, z, (void *)2, 15);
        }
        if (i == 3 && *(int *)(base + 0x3cc8) != 0) {
            func_ov004_021ca0a4((Record *)(base + 0x5f90), 2, left, z, (void *)2, 16);
            func_ov004_021ca0a4((Record *)(base + 0x5f90), 2, 182 - offset, z, (void *)2, 16);
        }
    }
    if (*(int *)(base + 0x90) == 4 && *(int *)(base + 0x9c) != 0)
        func_ov004_021ca0a4((Record *)(base + 0x5f90), 2, 25, 151, (void *)2, 17);
    func_ov004_021d705c(x, 156, 4, 2, 128);
}








