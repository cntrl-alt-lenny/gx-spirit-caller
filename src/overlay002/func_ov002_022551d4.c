typedef unsigned int u32;
typedef unsigned short u16;
struct Bits { u32 id:13; u32 flag:1; u32 pad:8; u32 idx:8; u32 rest:2; };
struct Slot { u32 pad[14]; u16 h38; u16 pad3a; int w3c; u32 w40; };
struct Ctx { char pad[0xcec]; int w; };
union Param { u32 value; struct { u32 amount:9; u32 player:1; u32 rest:22; } b; };
extern char data_ov002_022cf16c[];
extern struct Ctx data_ov002_022d016c;
extern int func_ov002_021d90c0(int flag, int arg1, int arg2);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
int func_ov002_022551d4(void)
{
    int result = 0;
    int player, i, j;
    int id, amount;
    struct Bits *q;
    struct Slot *p;
    union Param param;
    for (i = 0; i < 2; i++) {
        player = data_ov002_022d016c.w ^ i;
        q = (struct Bits *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x94);
        p = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x64);
        for (j = 5; j < 10; j++) {
            id = q->id;
            amount = p->w3c;
            if (id == 0x1403 && amount != 0) {
                u32 f;
                func_ov002_021d90c0(player, j, 0);
                f = p->w40;
                if (p->h38 & ~((f >> 6) & 1) & ~(((f >> 1) | (f >> 2)) & 1)) {
                    param.b.player = player;
                    param.b.amount = amount;
                    func_ov002_021e30b4(((player << 31) & 0x80000000) | 0x200000 | 0x10000000 | ((u32)((unsigned long long)j << 16) & 0x1f0000) | (u16)id,
                        (u16)(q->idx * 2 + q->flag), param.value);
                    result = 1;
                }
            }
            q = (struct Bits *)((char *)q + 0x14);
            p = (struct Slot *)((char *)p + 0x14);
        }
    }
    return result;
}







