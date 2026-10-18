typedef unsigned int u32;
typedef unsigned short u16;
typedef int s32;

struct Bits {
    u32 lo : 13;
    u32 hi : 19;
};

struct Slot {
    u32 pad[14];
    u16 h38;
    u16 pad3a;
    u32 pad3c;
    u32 w40;
};

extern char data_ov002_022cf16c[];
extern s32 func_ov002_021c93cc(s32 a, s32 b, s32 c);

s32 func_ov002_022550b8(s32 player)
{
    s32 i;
    struct Bits *q;
    struct Slot *p = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868);

    q = (struct Bits *)((char *)p + 0x30);
    for (i = 0; i <= 4; i++) {
        if (q->lo != 0 && p->h38 != 0) {
            u32 f = p->w40;
            if ((((f >> 1) | (f >> 2)) & 1) == 0) {
                if (func_ov002_021c93cc(player, i, 1) == 0) {
                    return 1;
                }
            }
        }
        q = (struct Bits *)((char *)q + 0x14);
        p = (struct Slot *)((char *)p + 0x14);
    }
    return 0;
}
