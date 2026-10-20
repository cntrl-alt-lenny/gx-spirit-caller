typedef unsigned int u32;
typedef unsigned short u16;
struct Bits { u32 id:13; u32 flag:1; u32 pad:8; u32 idx:8; u32 rest:2; };
struct Slot { char pad[0x38]; u16 h38; u16 pad3a; u32 w3c; u32 w40; };
struct Ctx { char pad[0xcec]; int w; };
extern char data_ov002_022cf16c[];
extern struct Ctx data_ov002_022d016c;
extern int func_ov002_021d90c0(int flag, int arg1, int arg2);
extern void func_ov002_021df62c(int arg0, int arg1, int idx);
extern int func_ov002_021df938(int side, int amount, int check, int card);
int func_ov002_02255c04(void)
{
    int result = 0;
    int i, player, j, side;
    struct Bits *q;
    struct Slot *p;
    for (i = 0; i < 2; i++) {
        player = data_ov002_022d016c.w ^ i;
        q = (struct Bits *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x94);
        p = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x64);
        for (j = 5; j < 10; j++) {
            if (q->id == 0x14bf && p->w3c != 0) {
                u32 f;
                func_ov002_021d90c0(player, j, 0);
                f = p->w40;
                if (p->h38 & ~((f >> 6) & 1) & ~(((f >> 1) | (f >> 2)) & 1)) {
                    side = data_ov002_022d016c.w;
                    func_ov002_021df62c(player, j, q->idx * 2 + q->flag);
                    func_ov002_021df938(side, (short)((p->w3c >> (side * 8)) & 0xff) * (short)500, side != player, 0x1717);
                    side ^= 1;
                    func_ov002_021df938(side, (short)((p->w3c >> (side * 8)) & 0xff) * (short)500, side != player, 0x1717);
                    result = 1;
                }
            }
            q = (struct Bits *)((char *)q + 0x14);
            p = (struct Slot *)((char *)p + 0x14);
        }
    }
    return result;
}


