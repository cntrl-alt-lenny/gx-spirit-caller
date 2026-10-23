typedef unsigned short u16;
typedef struct {
    u16 id;
    u16 flag : 1;
    u16 level : 5;
    u16 type : 6;
    u16 attribute : 2;
    u16 rest : 2;
    u16 pad[4];
    u16 value;
} Card;
extern int func_0202b3d4(void *arg0, int arg1);
int func_ov002_021b87f8(Card *p) {
    if (func_0202b3d4(p->id, 3)) {
        switch (p->id) {
        case 0x1299:
        case 0x164c:
        case 0x17c7:
        case 0x17c8:
        case 0x1806:
        case 0x18f6:
        case 0x18f9:
        case 0x196b:
        case 0x196c:
        case 0x196d:
        case 0x196e:
        case 0x19aa:
        case 0x1a37:
        case 0x1a92:
        case 0x1b39:
            return 0;
        case 0x172f:
        case 0x1aca:
            return p->attribute == 0;
        case 0x1232:
        case 0x146f:
        case 0x1529:
        case 0x153b:
        case 0x15e0:
        case 0x15e2:
        case 0x19d8:
        case 0x1b5c:
            return p->attribute == 3;
        case 0x1534:
        case 0x17b2:
        case 0x187f:
        case 0x1971:
        case 0x1972:
        case 0x19a5:
            return p->attribute == 1;
        case 0x12a1:
        case 0x133b:
        case 0x1612:
        case 0x190a:
        case 0x197d:
        case 0x1a0c:
        case 0x1a28:
        case 0x1a61:
        case 0x1a9f:
        case 0x1b3d:
            return p->attribute == 2;
        case 0x13c7:
        case 0x188f:
            return p->type == 0x16;
        case 0x13ff:
        case 0x1522:
        case 0x17d5:
        case 0x185c:
        case 0x1ad6:
        case 0x1ad7:
        case 0x1adc:
        case 0x1add:
            return p->type == 2;
        case 0x17d7:
        case 0x17d8:
        case 0x17da:
        case 0x17f8:
            return p->type == 5;
        case 0x15d0:
            return p->type == 6;
        case 0x15b0:
        case 0x15b3:
        case 0x15ce:
        case 0x15d1:
        case 0x15d5:
        case 0x15d6:
        case 0x15d7:
        case 0x1620:
        case 0x1693:
        case 0x1825:
        case 0x1917:
        case 0x194b:
            if (p->level >= 5 && p->attribute == 3) return 1;
            return 0;
        case 0x15cf:
        case 0x15d3:
        case 0x1916:
            if (p->level >= 5 && p->value == 1) return 1;
            return 0;
        case 0x15f7:
            return p->value == 2;
        case 0x1a1a:
            return p->value;
        case 0x1a1c:
            return p->value == 3;
        case 0x17af:
            return p->type != 5 && p->value != 0;
        default:
        case 0x199e:
            return 1;
        }
    }
    return 0;
}
