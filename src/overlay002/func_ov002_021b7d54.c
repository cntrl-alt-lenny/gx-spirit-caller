typedef unsigned short u16;
typedef unsigned char u8;
struct node {
    u16 kind;
    u16 owner:1;
    u16 pad2:11;
    u16 mode:2;
    u16 rest2:2;
    u16 pad4;
    u16 count:8;
    u16 rest6:8;
    u16 arr8[5];
    u16 f18;
    union { int value; struct { unsigned pad:9; unsigned owner:1; unsigned rest:22; } bits; } f20;
};
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_0202e234(int x);
int func_ov002_021b7d54(struct node *self)
{
    int result = 0;
    int i;
    for (i = 0; i < self->count; i++) {
        int pair = func_ov002_0223de94(self, i);
        u8 kind = (u8)((u16)pair >> 8);
        u8 owner = (u8)pair;
        if (kind == 14) result |= (self->owner != owner) + 1;
    }
    switch (self->kind) {
    case 0x12ea:
    case 0x1af9:
        break;
    case 0x100c:
    case 0x106d:
    case 0x1138:
    case 0x1152:
    case 0x1294:
    case 0x1359:
    case 0x1366:
    case 0x137d:
    case 0x138a:
    case 0x13f5:
    case 0x1446:
    case 0x148b:
    case 0x14a7:
    case 0x14c1:
    case 0x14d2:
    case 0x14ea:
    case 0x14ef:
    case 0x14f6:
    case 0x14f7:
    case 0x156a:
    case 0x156d:
    case 0x1576:
    case 0x158b:
    case 0x1616:
    case 0x1630:
    case 0x1631:
    case 0x1638:
    case 0x164a:
    case 0x164f:
    case 0x1664:
    case 0x168f:
    case 0x16a4:
    case 0x16a8:
    case 0x16bc:
    case 0x16d5:
    case 0x16f8:
    case 0x1714:
    case 0x1745:
    case 0x1769:
    case 0x1788:
    case 0x178a:
    case 0x178c:
    case 0x1795:
    case 0x17a2:
    case 0x17b7:
    case 0x17f1:
    case 0x17f7:
    case 0x1820:
    case 0x183d:
    case 0x1845:
    case 0x1864:
    case 0x187a:
    case 0x1880:
    case 0x1881:
    case 0x1895:
    case 0x18a4:
    case 0x18cc:
    case 0x191f:
    case 0x1927:
    case 0x1938:
    case 0x1944:
    case 0x1951:
    case 0x196f:
    case 0x1971:
    case 0x1973:
    case 0x1974:
    case 0x1979:
    case 0x19d7:
    case 0x1a03:
    case 0x1a12:
    case 0x1a42:
    case 0x1a58:
    case 0x1a59:
    case 0x1a64:
    case 0x1a6b:
    case 0x1a9b:
    case 0x1b65:
        return 1;
    case 0x1379:
    case 0x143d:
    case 0x1488:
    case 0x14e7:
    case 0x15e6:
    case 0x15fd:
    case 0x19f4:
        return 2;
    case 0x1365:
    case 0x14f0:
    case 0x14fb:
    case 0x1536:
    case 0x1990:
        return 3;
    case 0x13fe:
    case 0x1445:
    case 0x1610:
    case 0x1611:
    case 0x1629:
    case 0x167d:
    case 0x1713:
    case 0x195c:
    case 0x198e:
    case 0x19b1:
    case 0x1a05:
        return 0;
    case 0x12a6:
    case 0x1415:
    case 0x158f:
    case 0x1592:
    case 0x1791:
    case 0x1a95:
        return 0;
    case 0x12ba:
        result |= (self->f20.bits.owner != self->owner) + 1;
        break;
    case 0x133b:
    case 0x1449:
    case 0x144c:
    case 0x1452:
    case 0x1457:
    case 0x1549:
    case 0x179a:
    case 0x1aa9:
        result |= self->mode == 2;
        break;
    case 0x1534:
    case 0x187f:
    case 0x197c:
        result |= self->mode == 1;
        break;
    case 0x1686:
        result |= self->arr8[2] == 2;
        break;
    case 0x190a:
        if (self->mode != 2 && func_0202e234(self->f20.value)) return 1;
        break;
    }
    return result;
}



