typedef struct {
    char pad[0x1ce];
    unsigned char paletteA;
    unsigned char paletteB;
    int unused;
    int value;
} Data;
typedef struct {
    char pad[0xd0];
    unsigned short value;
    char pad2[6];
    unsigned short flags;
} Flags;
typedef struct {
    int unused;
    unsigned int mode;
    int unused2;
    int a;
    int b;
    int unused3[2];
    int saved;
    unsigned char choices[1];
} Menu;
extern Data data_ov017_021b8894;
extern Flags data_ov017_021b8994;
extern int func_02037208(int a0, int r1, int r2, int r3);
extern void func_ov017_021b61dc(Menu *p);
int func_ov017_021b646c(Menu *p) {
    unsigned int value;
    unsigned char *row;
    int index;
    switch (p->mode) {
    case 0:
        row = (unsigned char *)p + p->a;
        index = p->b;
        value = (row + index)[0x20];
        if (data_ov017_021b8894.paletteA != value) {
            data_ov017_021b8894.paletteA = value;
            data_ov017_021b8994.flags = 4;
            p->saved = p->a + p->b;
            func_02037208(0x38, -1, 0, 1);
        }
        break;
    case 1:
        row = (unsigned char *)p + p->a;
        index = p->b;
        value = (row + index)[0x20];
        if (data_ov017_021b8894.paletteB != value) {
            data_ov017_021b8894.paletteB = value;
            data_ov017_021b8994.flags = 8;
            p->saved = p->a + p->b;
            func_02037208(0x38, -1, 0, 1);
        }
        break;
    case 2:
        row = (unsigned char *)p + p->a;
        index = p->b;
        value = (row + index)[0x20];
        if (data_ov017_021b8994.value != value) {
            data_ov017_021b8994.value = value;
            data_ov017_021b8994.flags = 0x10;
            func_ov017_021b61dc(p);
            p->saved = p->a + p->b;
            func_02037208(0x38, -1, 0, 1);
        }
        break;
    case 3:
        row = (unsigned char *)p + p->a;
        index = p->b;
        value = (row + index)[0x20];
        if (data_ov017_021b8894.value != value) {
            data_ov017_021b8894.value = value;
            data_ov017_021b8994.flags = 0x40;
            p->saved = p->a + p->b;
            func_02037208(0x38, -1, 0, 1);
        }
        break;
    }
    return 1;
}








