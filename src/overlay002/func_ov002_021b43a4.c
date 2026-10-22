typedef unsigned short u16;
typedef unsigned int u32;
struct Input { u16 index:16; u16 kind:4; u16 rest:12; };
struct Card { u32 id:13; u32 rest:19; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1ac[];
extern int func_ov002_021b9ecc(int a, int b);
int func_ov002_021b43a4(struct Input *p, int arg1, int arg2) {
    int index = p->index;
    int a = index & 0xff;
    int b = (index >> 8) & 0xff;
    switch (p->kind) {
    case 10: case 11: case 12: case 13:
        if (((struct Card *)(data_ov002_022cf16c + (a & 1) * 0x868 + b * 20 + 0x30))->id != 0)
            return 1;
        break;
    case 6: case 7: case 8: case 9:
        switch (func_ov002_021b9ecc(a, b)) {
        case 0x1103: case 0x137d: case 0x17b7: case 0x180f:
        case 0x1a36: case 0x1a7e: case 0x1a9b: case 0x1a9c:
            if (!((*(u32 *)(data_ov002_022cf1ac + (a & 1) * 0x868 + b * 20) >> 6) & 1))
                return arg1;
            break;
        case 0x1602:
            return arg1 && arg2;
        case 0x19ed:
            return 2;
        case 0x1243: case 0x13f0: case 0x14b2: case 0x14fc:
        case 0x16a2: case 0x184b: case 0x18d3: case 0x1b65:
            if (!((*(u32 *)(data_ov002_022cf1ac + (a & 1) * 0x868 + b * 20) >> 6) & 1))
                return 1;
            break;
        }
        break;
    }
    return 0;
}


