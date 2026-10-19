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
extern Data data_ov017_021b8894;
extern Flags data_ov017_021b8994;

int func_ov017_021b6610(int *arg) {
    switch (arg[1]) {
    case 0:
        data_ov017_021b8894.paletteA = arg[0x18];
        data_ov017_021b8994.flags = 4;
        break;
    case 1:
        data_ov017_021b8894.paletteB = arg[0x18];
        data_ov017_021b8994.flags = 8;
        break;
    case 2:
        data_ov017_021b8994.value = arg[0x18];
        data_ov017_021b8994.flags = 0x10;
        break;
    case 3:
        data_ov017_021b8894.value = arg[0x18];
        data_ov017_021b8994.flags = 0x40;
        break;
    }
    return 1;
}
