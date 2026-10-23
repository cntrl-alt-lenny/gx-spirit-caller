typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 id:13; u32 side:1; u32 pad:8; u32 index:8; u32 rest:2; } Card;
typedef struct { u32 index:9; u32 side:1; u32 zero:1; u32 flip:1; u32 kind:4; u32 rest:16; } Event;
extern unsigned int func_0202b878(int id);
extern int func_ov002_021b3fd8(int,int,int,int);
extern int func_ov002_021baca8(int,int,int);
extern int func_ov002_021ca5bc(int);
extern void func_ov002_021d479c(u16,u16,u16,u16);
extern void func_ov002_021df62c(int,int,int);
extern void func_ov002_021df6d4(int,int);
extern int func_ov002_021df938(int,int,int,int);
/* The original passes an integer side in r0 at both call sites. */
extern void func_ov002_021e276c(int,int,int,int);
extern void func_ov002_021e2d94(int,int,int,int);
extern int func_ov002_021e30b4(int,int,int);
extern void func_ov002_02244fe4(int,u32);
extern void func_ov002_022538bc(int,int,int);
extern void func_ov002_02253af8(int,int);
extern void func_ov002_02254c64(int);
void func_ov002_021d730c(int player, Card *card, int flags, int kind, int active, int mode) {
    int enabled = (flags & 1) > 0 ? 1 : 0;
    int event = active != 0 ? 0x1d : 0x1e;
    Event e = {0};
    if (kind == 14) {
        if (func_ov002_021ca5bc(card->index * 2 + card->side) == 0) kind = 15;
    }
    e.index = card->index * 2 + card->side;
    e.side = player;
    e.zero = 0;
    e.flip = player ^ enabled;
    e.kind = kind;
    if (flags & 0x1000) {
        func_ov002_021d479c((u16)((player ? 0x8000 : 0) | 0x46), 11, (u16)kind, (u16)e.index);
    } else if (kind == 15) {
        func_ov002_021d479c((u16)((player ? 0x8000 : 0) | 0x33), 11, (u16)flags, (u16)(card->index * 2 + card->side));
    } else {
        int side = card->side;
        int index = side + card->index * 2;
        func_ov002_021d479c(0x3f, (u16)(((index & 0x3ff) << 6) | ((player & 1) | 0x16)), (side & 1) | 0x5c, (u16)flags);
    }
    if (kind == 14) {
        flags = 0;
        switch (card->id) {
        case 0x14a5:
            func_ov002_021df62c(card->side,14,card->side + card->index * 2);
        case 0x16f9:
            func_ov002_021e276c(card->side,(u16)card->id,1,(u16)(card->side + card->index * 2));
            break;
        case 0x1175: case 0x11bc: case 0x1653: case 0x1655: case 0x1793: case 0x1794: case 0x1799:
            if (enabled != 0) {
                if (player == card->side) flags = 1;
            }
            break;
        case 0x1185: case 0x12a2: case 0x1309: case 0x13e3: case 0x1687: case 0x16f5: case 0x179a: case 0x17c5: case 0x1828: case 0x1946: case 0x19fe:
            flags = 1;
            break;
        case 0x1965: case 0x1966: case 0x1968: case 0x1969: case 0x1b3e: case 0x1b3f:
            if (mode == 0 && active != 0) flags = 1;
            else flags = 0;
            break;
        }
        if (flags != 0) {
            func_ov002_021e30b4(((u32)card->side << 31 & 0x80000000) | ((u32)event << 25 & 0x7e000000) | 0x4e0000 | (u16)card->id, (u16)(card->side + card->index * 2), *(u32 *)&e);
        }
        if (enabled != 0 && mode == 0 && active != 0 && player == card->side) func_ov002_02253af8(player,0x17a4);
        if (func_0202b878(card->id) == 9) {
            int i;
            for (i = 0; i <= 4; i++) {
                if (func_ov002_021baca8(card->side,i,0x1a8d) != 0) func_ov002_021e2d94(card->side,i,5,1);
            }
        }
    }
    func_ov002_02244fe4((u16)event,*(u32 *)&e);
    if (active != 0) {
        if (player == card->side && kind == 14) func_ov002_022538bc(1-player,0x1306,1);
        func_ov002_02254c64(player);
        if (mode != 2) {
            if (func_0202b878(card->id) == 1) func_ov002_021e276c(player,0x14e2,2,0);
        }
    }
    if (mode == 1) {
        if (func_ov002_021b3fd8(player,11,0x1379,card->index * 2 + card->side) != 0) {
            func_ov002_021df6d4(player,0x1379);
            func_ov002_021df938(player,2000,0,0x1379);
        }
    }
}







