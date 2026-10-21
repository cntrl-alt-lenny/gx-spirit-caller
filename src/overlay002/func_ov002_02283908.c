struct Slot { unsigned short value; char pad[18]; };
struct Stat { int value; char pad[40]; };
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a8[];
extern struct Stat data_ov002_022cd548[][5];
extern struct Stat data_ov002_022cd550[][5];
extern struct Stat data_ov002_022cd544[][5];
extern int func_ov002_021b9ecc(int player, int slot);
int func_ov002_02283908(int player, int source, int target) {
    int result;
    switch (func_ov002_021b9ecc(player, source)) {
    case 0x1524: case 0x15e0: case 0x17d7: case 0x17d8: case 0x1823: case 0x1829:
        result = 0;
        if (((struct Slot *)(data_ov002_022cf1a4 + ((1-player)&1)*0x868))[target].value != 0) return result;
        if (((struct Slot *)(data_ov002_022cf1a2 + ((1-player)&1)*0x868))[target].value != 0) result = 1;
        return result;
    case 0x17df:
        result = 0;
        if (((struct Slot *)(data_ov002_022cf1a4 + ((1-player)&1)*0x868))[target].value == 0) return result;
        if (((struct Slot *)(data_ov002_022cf1a2 + ((1-player)&1)*0x868))[target].value != 0) result = 1;
        return result;
    case 0x1963:
        result = 0;
        if (((struct Slot *)(data_ov002_022cf1a4 + ((1-player)&1)*0x868))[target].value == 0) return result;
        if (data_ov002_022cd548[1-player][target].value <= 3) result = 1;
        return result;
    case 0x1752:
        result = 0;
        if (((struct Slot *)(data_ov002_022cf1a2 + ((1-player)&1)*0x868))[target].value == 0) return result;
        if (data_ov002_022cd550[1-player][target].value >= 0x7d0) result = 1;
        return result;
    case 0x18f3:
        return ((struct Slot *)(data_ov002_022cf1a2 + ((1-player)&1)*0x868))[target].value;
    case 0x19c2:
        result = 0;
        if (((struct Slot *)(data_ov002_022cf1a4 + ((1-player)&1)*0x868))[target].value == 0) return result;
        if ((data_ov002_022cd544[1-player][target].value & *(unsigned int *)(data_ov002_022cf1a8 + (player&1)*0x868 + source*0x14)) != 0) result = 1;
        return result;
    }
    return 0;
}

