typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { int f0, field, f8; u32 flags; int f10[5]; int mask24, mask28; } Context;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022d016c[];
extern int func_ov002_021b9ecc(int, int);
extern int func_ov002_021b3ecc(int, int, int);
/* Original caller supplies only r0 and r1 to this four-argument thunk. */
extern int func_ov002_021bbc58();
extern int func_ov002_021bd5f4(int, int);
extern int func_0202f050(int);
u32 func_ov002_021c4158(Context *ctx, int player, int slot, int other, int target) {
    int id = func_ov002_021b9ecc(player, slot);
    int attack = 0;
    int defense = 0;
    if (slot <= 4) {
        switch (id) {
        case 0x1192:
            if (ctx->flags & 2) attack += 500;
            if (ctx->flags & 4) attack -= 400;
            break;
        case 0x121a:
            if (ctx->flags & 4) attack += 500;
            if (ctx->flags & 2) attack -= 400;
            break;
        case 0x11b2:
            if (ctx->flags & 8) attack += 500;
            if (ctx->flags & 16) attack -= 400;
            break;
        case 0x11fc:
            if (ctx->flags & 16) attack += 500;
            if (ctx->flags & 8) attack -= 400;
            break;
        case 0x11b5:
            if (ctx->flags & 32) attack += 500;
            if (ctx->flags & 64) attack -= 400;
            break;
        case 0x1207:
            if (ctx->flags & 64) attack += 500;
            if (ctx->flags & 32) attack -= 400;
            break;
        case 0x13a0:
            if (ctx->field == 13 && other == player) {
                if (*(u16 *)(data_ov002_022cf1a2 + (player & 1) * 0x868 + slot * 20) != 0) {
                    attack += 500;
                    defense += 500;
                }
            }
            break;
        case 0x1399:
            if (ctx->field == 15 && other == player) attack += 400;
            break;
        case 0x1483:
            if (player != other && other == *(int *)(data_ov002_022d016c + 0xcec) && *(int *)(data_ov002_022d016c + 0xcf8) == 3) attack -= 300;
            break;
        case 0x16ab:
            if (player == other && (ctx->flags & 8)) attack += 200;
            break;
        case 0x1822:
            if (player != other && func_ov002_021b3ecc(player, slot, id) != 0) attack -= 300;
            break;
        case 0x182a:
            if (ctx->flags & 64) attack += 300;
            break;
        case 0x185e:
            if (player != other && func_ov002_021b3ecc(player, slot, id) != 0) attack -= 500;
            break;
        case 0x18af:
            if (player != other && func_ov002_021b3ecc(player, slot, id) != 0) { attack -= 700; defense -= 700; }
            break;
        case 0x191c:
            if (player == other && ctx->field == 7) {
                int i; char *p = data_ov002_022cf16c + (other & 1) * 0x868; int counts[2] = {0, 0};
                for (i = 0; i <= 4; i++, p += 20) {
                    if (func_ov002_021b9ecc(other, i) == 0x191c && *(u16 *)(p + 0x38) != 0) counts[*(u16 *)(p + 0x36)]++;
                }
                if (counts[1] == 0) attack += 500;
                if (counts[0] == 0) defense += 500;
            }
            break;
        }
    }
    if (slot >= 5 && (ctx->mask24 & ((other != player) + 1)) <= 0) {
        switch (id) {
        case 0x13f6:
            if (ctx->flags & 8) attack -= 500;
            break;
        case 0x14cf:
            if (ctx->field == 15 && other == player) {
                attack += func_ov002_021bbc58(other, 15) * 200;
                attack += func_ov002_021bbc58(other, 18) * 200;
            }
            break;
        case 0x1429:
            if (other == player) defense += 300;
            break;
        case 0x15a2:
            if (other == player && other == *(int *)(data_ov002_022d016c + 0xcec) && *(int *)(data_ov002_022d016c + 0xcf8) == 3) attack += 200;
            break;
        case 0x19b2:
            if (func_0202f050(func_ov002_021b9ecc(other, target)) != 0) attack += 300;
            break;
        }
    }
    if (slot >= 5 && (ctx->mask28 & ((other != player) + 1)) <= 0) {
        if (id == 0x138e && func_ov002_021bd5f4(other, target) != 0) {
            attack += 500;
            defense += 500;
        }
    }
    return (u16)attack | ((u32)(u16)defense << 16);
}



