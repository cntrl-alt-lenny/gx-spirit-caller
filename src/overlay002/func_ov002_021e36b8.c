typedef unsigned short u16;
struct Card {
    u16 id;
    u16 low : 6;
    u16 kind : 6;
    u16 cat : 2;
    u16 high : 2;
};

int func_ov002_021e36b8(struct Card *p) {
    int kind = p->kind;
    if (kind == 0x22)
        return 0;
    switch (p->id) {
    case 0x1315:
    case 0x13f5:
    case 0x140c:
    case 0x1449:
    case 0x144c:
    case 0x1452:
    case 0x1457:
    case 0x14e2:
    case 0x15b8:
    case 0x1a02:
    case 0x1a7a:
        if (p->cat == 2)
            return 0;
        break;
    case 0x1282:
    case 0x13c7:
    case 0x188f:
    case 0x1a7e:
        if (kind == 2)
            return 0;
        break;
    }
    return 1;
}
