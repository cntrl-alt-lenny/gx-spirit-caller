typedef unsigned int u32;
typedef unsigned short u16;
typedef int s32;

extern char data_ov002_022cf16c[];
struct Row {
    u32 w;
    char pad[0x864];
};
extern struct Row data_ov002_022cf288[];
extern s32 func_ov002_0226eb5c(s32 a, s32 b, s32 c, s32 d);

struct Hdr {
    u16 pad;
    u16 b0 : 1;
    u16 mid : 13;
    u16 b14 : 1;
    u16 b15 : 1;
};

struct Ent {
    u32 lo : 13;
    u32 b13 : 1;
    u32 mid : 8;
    u32 hi : 8;
    u32 top : 2;
};

s32 func_ov002_0220d094(struct Hdr *arg)
{
    s32 player = arg->b0 ^ arg->b14;
    s32 side = player & 1;
    u32 j;
    s32 i;
    s32 limit;
    char *base;
    u32 *p;

    if ((data_ov002_022cf288[side].w >> 17) & 1) {
        return 0;
    }
    i = 1;
    base = data_ov002_022cf16c + side * 0x868;
    limit = 1000;
    for (; i <= 3; i++) {
        if (*(s32 *)base <= limit) {
            break;
        }
        for (j = 0; j < *(u32 *)(base + 0xc); j++) {
            struct Ent *x = (struct Ent *)(base + 0x120) + j;
            if (func_ov002_0226eb5c(player, x->hi * 2 + x->b13, 1, i)) {
                return 1;
            }
        }
        limit += 1000;
    }
    return 0;
}
