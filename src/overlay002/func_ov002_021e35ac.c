typedef unsigned short u16;
struct Card {
    u16 id;
    u16 low : 12;
    u16 cat : 2;
    u16 high : 2;
};

int func_ov002_021e35ac(struct Card *p) {
    switch (p->id) {
    case 0x1445:
    case 0x17c9:
    case 0x17cc:
    case 0x18ec:
    case 0x190a:
    case 0x197d:
    case 0x1a28:
        if (p->cat == 2)
            return 0;
        return 1;
    case 0x1174:
    case 0x133b:
        return 0;
    case 0x1a90:
        if (p->cat == 2)
            return 1;
        return 0;
    default:
        return 1;
    }
}
