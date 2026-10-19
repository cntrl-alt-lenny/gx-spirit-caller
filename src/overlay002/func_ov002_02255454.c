typedef unsigned int u32;
typedef unsigned short u16;
struct Bits { u32 id:13; u32 flag:1; u32 pad:8; u32 idx:8; u32 rest:2; };
struct Slot { u32 pad[14]; u16 h38; u16 pad3a; int w3c; u32 w40; };
struct Ctx { char pad[0xcec]; int w; };
extern char data_ov002_022cf16c[];
extern struct Ctx data_ov002_022d016c;
extern int func_ov002_021b9ecc(int player, int slot);
extern int func_ov002_021d90c0(int flag, int arg1, int arg2);
extern void func_ov002_021df62c(int arg0, int arg1, int idx);
extern int func_ov002_021df938(int player, int amount, int flag, int id);
int func_ov002_02255454(void)
{
    int result = 0;
    int j, player, i, amount, other;
    struct Bits *q;
    struct Slot *p;
    for (i = 0; i < 2; i++) {
        player = data_ov002_022d016c.w ^ i;
        p = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868);
        q = (struct Bits *)((char *)p + 0x30);
        other = 1 - player;
        for (j = 0; j <= 4; j++) {
            int id = func_ov002_021b9ecc(player, j);
            amount = p->w3c;
            if (id == 0x144d && amount != 0) {
                u32 f;
                func_ov002_021d90c0(player, j, 0);
                f = p->w40;
                if (p->h38 & ~((f >> 6) & 1) & ~(((f >> 1) | (f >> 2)) & 1)) {
                    func_ov002_021df62c(player, j, q->idx * 2 + q->flag);
                    for (i = 0; i < amount; i++) {
                        func_ov002_021df938(other, 500, 1, 0x144d);
                    }
                    result = 1;
                }
            }
            p = (struct Slot *)((char *)p + 0x14);
            q = (struct Bits *)((char *)q + 0x14);
        }
    }
    return result;
}


