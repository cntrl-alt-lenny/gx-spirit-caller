typedef struct {
    char pad[0xdc];
    short mode;
    unsigned short x;
    unsigned short y;
} Obj;

int func_0202acec(Obj *o) {
    unsigned short *reg;
    switch (o->mode) {
    case 0:
        reg = (unsigned short *)0x04000048;
        reg[0] = (reg[0] & ~0x3f) | o->x | 0x20;
        reg[1] = (reg[1] & ~0x3f) | o->y | 0x20;
        break;
    case 1:
        reg = (unsigned short *)0x04000048;
        reg[0] = (reg[0] & ~0x3f00) | (o->x << 8) | 0x2000;
        reg[1] = (reg[1] & ~0x3f) | o->y | 0x20;
        break;
    case 2:
        reg = (unsigned short *)0x04001048;
        reg[0] = (reg[0] & ~0x3f) | o->x | 0x20;
        reg[1] = (reg[1] & ~0x3f) | o->y | 0x20;
        break;
    case 3:
        reg = (unsigned short *)0x04001048;
        reg[0] = (reg[0] & ~0x3f00) | (o->x << 8) | 0x2000;
        reg[1] = (reg[1] & ~0x3f) | o->y | 0x20;
        break;
    }
    return 1;
}
