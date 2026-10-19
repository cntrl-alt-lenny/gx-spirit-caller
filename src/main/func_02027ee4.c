typedef unsigned int u32;
typedef struct {
    char pad0[0xd4];
    short kind;
    char pad1[8];
    unsigned short active:1, visible:1;
} Obj;
int func_02027ee4(Obj *p) {
    u32 mask;
    switch (p->kind) {
    case 0: mask=1; goto main_update;
    case 1: mask=2; goto main_update;
    case 2: mask=4; goto main_update;
    case 3: mask=8;
main_update:
        if (p->active && p->visible) {
            u32 layers = (*(volatile u32 *)0x04000000 & 0x1f00) >> 8;
            *(volatile u32 *)0x04000000 = (*(volatile u32 *)0x04000000 & ~0x1f00) | ((mask | layers) << 8);
        } else {
            u32 layers = (*(volatile u32 *)0x04000000 & 0x1f00) >> 8;
            *(volatile u32 *)0x04000000 = (*(volatile u32 *)0x04000000 & ~0x1f00) | ((~mask & layers) << 8);
        }
        break;
    case 4: mask=1; goto sub_update;
    case 5: mask=2; goto sub_update;
    case 6: mask=4; goto sub_update;
    case 7: mask=8;
sub_update:
        if (p->active && p->visible) {
            u32 layers = (*(volatile u32 *)0x04001000 & 0x1f00) >> 8;
            *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0x1f00) | ((mask | layers) << 8);
        } else {
            u32 layers = (*(volatile u32 *)0x04001000 & 0x1f00) >> 8;
            *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0x1f00) | ((~mask & layers) << 8);
        }
        break;
    }
    return 1;
}
