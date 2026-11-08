typedef unsigned int u32;
typedef struct {
    char pad0[0xdc];
    short kind;
    char pad1[12];
    unsigned short active:1, visible:1;
} Obj;
int func_0202abdc(Obj *p) {
    u32 mask;
    switch (p->kind) {
    case 0: mask=1; goto main_update;
    case 1: mask=2;
main_update:
        if (p->active && p->visible) {
            u32 layers = (*(volatile u32 *)0x04000000 & 0xe000) >> 13;
            *(volatile u32 *)0x04000000 = (*(volatile u32 *)0x04000000 & ~0xe000) | ((mask | layers) << 13);
        } else {
            u32 layers = (*(volatile u32 *)0x04000000 & 0xe000) >> 13;
            *(volatile u32 *)0x04000000 = (*(volatile u32 *)0x04000000 & ~0xe000) | ((~mask & layers) << 13);
        }
        break;
    case 2: mask=1; goto sub_update;
    case 3: mask=2;
sub_update:
        if (p->active && p->visible) {
            u32 layers = (*(volatile u32 *)0x04001000 & 0xe000) >> 13;
            *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0xe000) | ((mask | layers) << 13);
        } else {
            u32 layers = (*(volatile u32 *)0x04001000 & 0xe000) >> 13;
            *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0xe000) | ((~mask & layers) << 13);
        }
        break;
    }
    return 1;
}


