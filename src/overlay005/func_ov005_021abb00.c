typedef struct {
    char pad0[0xe];
    short y;
    char pad10[0x20];
    int x;
    int position;
    char pad38[0x24];
    unsigned short background : 2;
    unsigned short flags : 14;
} State;

void func_ov005_021abb00(State *p) {
    switch (p->background) {
    case 0:
        *(volatile unsigned int *)0x04001010 = (p->x & 0xff) | (((p->position & 0xff) - p->y) << 16 & 0x01ff0000);
        break;
    case 1:
        *(volatile unsigned int *)0x04001014 = (p->x & 0xff) | (((p->position & 0xff) - p->y) << 16 & 0x01ff0000);
        break;
    case 2:
        *(volatile unsigned int *)0x04001018 = (p->x & 0xff) | (((p->position & 0xff) - p->y) << 16 & 0x01ff0000);
        break;
    case 3:
        *(volatile unsigned int *)0x0400101c = (p->x & 0xff) | (((p->position & 0xff) - p->y) << 16 & 0x01ff0000);
        break;
    }
}
