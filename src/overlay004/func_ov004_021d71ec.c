typedef struct { int scale; int mode; int unused[2]; void *entry; } Record;
extern void func_ov004_021ca0a4(Record *self, int a, int x, int y, void *p, int index);
extern void func_ov004_021d705c(int x, int y, int tile, int pal, int width);
extern void func_ov004_021d7118(int x, int y, int width, int height);
extern int func_020342f0(void);
typedef struct { char pad0[0x54]; int state, transition, unused5c, flag; char pad64[0x2c]; int selected; int unused94, unused98, active; char pada0[0x3bec]; int choice; char pad3c90[0x14]; int widths[3]; char pad3cb0[0x22e0]; Record sprite; } State;
extern State data_ov004_0220b500;
extern char data_021040ac[];
void func_ov004_021d71ec(void) {
    char *base = (char *)&data_ov004_0220b500;
    int a = 0;
    int b = 0;
    int i, x, y, index, offset;
    switch (((State *)base)->state) {
    case 0: case 1: return;
    case 2: b = 256 - ((State *)base)->transition; break;
    case 3:
        if (((State *)base)->selected >= 0 && ((State *)base)->flag == 0)
            func_ov004_021d7118(20, ((State *)base)->selected * 52 + 7, 216, 45);
        break;
    case 4: b = ((State *)base)->transition; break;
    case 5: a = ((State *)base)->transition; if (a < 0) a = -a; break;
    case 6: a = 256; break;
    }
    x = ((256 - a) * 20 + a * 208) / 256;
    for (i = 0; i < 3; i++) {
        y = (b * 192 + (256 - b) * (i * 52 + 7)) / 256;
        if (a == 256) index = i * 2; else index = i + 6;
        if (a == 0 && i == ((State *)base)->selected) {
            if (((State *)base)->active != 0) index = i + 9;
        }
        if (a == 256 && i != 0 && i == ((State *)base)->choice) index = i * 2 + 1;
        func_ov004_021ca0a4((Record *)(base + 0x5f90), 2, x, y, (void *)3, index);
        if (a == 0) {
            offset = 12;
            if (((State *)base)->widths[i] > 128)
                offset += (((State *)base)->widths[i] - 128) / 2;
            func_ov004_021d705c(x + offset, y + 17, i, 2, 192);
        }
        if (i == 1 && func_020342f0() != 0 && (*(int *)(data_021040ac + 0x38) & 32)) {
            func_ov004_021ca0a4((Record *)(base + 0x5f90), 2, x + 2, y + 2, (void *)2, 28);
        }
    }
}


