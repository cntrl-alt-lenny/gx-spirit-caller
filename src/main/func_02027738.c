typedef struct {
    char pad0[0xb4];
    int x, y;
    char padbc[0x14];
    unsigned short *buffer;
    short layer;
    char padd6[8];
    unsigned short active:1, b1:1, b2:1, animate:1;
} Obj;
extern int func_0202838c(Obj *o);
int func_02027738(Obj *o) {
    int x, y;
    if (!o->active) return 1;
    x = -(o->x >> 4);
    y = -(o->y >> 4);
    switch (o->layer) {
    case 0: *(volatile unsigned int *)0x04000010 = (x & 0x1ff) | ((y << 16) & 0x1ff0000); break;
    case 1: *(volatile unsigned int *)0x04000014 = (x & 0x1ff) | ((y << 16) & 0x1ff0000); break;
    case 2: *(volatile unsigned int *)0x04000018 = (x & 0x1ff) | ((y << 16) & 0x1ff0000); break;
    case 3: *(volatile unsigned int *)0x0400001c = (x & 0x1ff) | ((y << 16) & 0x1ff0000); break;
    case 4: *(volatile unsigned int *)0x04001010 = (x & 0x1ff) | ((y << 16) & 0x1ff0000); break;
    case 5: *(volatile unsigned int *)0x04001014 = (x & 0x1ff) | ((y << 16) & 0x1ff0000); break;
    case 6: *(volatile unsigned int *)0x04001018 = (x & 0x1ff) | ((y << 16) & 0x1ff0000); break;
    case 7: *(volatile unsigned int *)0x0400101c = (x & 0x1ff) | ((y << 16) & 0x1ff0000); break;
    }
    if (o->animate && o->buffer) func_0202838c(o);
    return 1;
}

