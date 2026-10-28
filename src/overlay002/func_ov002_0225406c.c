typedef unsigned int u32;
struct Bits { u32 id:13; u32 flag:1; u32 pad:8; u32 idx:8; u32 rest:2; };
struct Ctx { char pad[0xcec]; int w; };
extern char data_ov002_022cf16c[];
extern struct Ctx data_ov002_022d016c;
extern int func_ov002_021baca8(int a0, int a1, int a2);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
void func_ov002_0225406c(int a, int b)
{
    int i, player, j;
    struct Bits *p;
    for (i = 0; i < 2; i++) {
        player = data_ov002_022d016c.w ^ i;
        p = (struct Bits *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30);
        for (j = 0; j < 5; j++) {
            if ((player != a || j != b) && func_ov002_021baca8(player, j, 0x104c)) {
                func_ov002_021e30b4(((player << 31) & 0x80000000) | 0x200000 | (((u32)j << 16) & 0x1f0000) | 0x104c,
                    (unsigned short)(p->idx * 2 + p->flag), 0);
            }
            p = (struct Bits *)((char *)p + 0x14);
        }
    }
}


