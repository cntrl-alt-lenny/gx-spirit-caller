typedef unsigned int u32;
typedef unsigned short u16;
struct Bits { u32 id:13; u32 flag:1; u32 pad:8; u32 idx:8; u32 rest:2; };
struct Slot { u32 pad[14]; u16 h38; u16 pad3a; u32 w3c; u32 w40; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021bae7c(int player, int id, int except);
extern int func_ov002_021d90c0(int flag, int arg1, int arg2);
extern void func_ov002_021d90fc(int arg0, int arg1, unsigned int arg2);
extern void func_ov002_021e2d94(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
void func_ov002_02254c64(int a)
{
    int i;
    int id;
    struct Bits *q;
    struct Slot *p;
    int player;
    char *base;
    if (func_ov002_021bae7c(a, 0x1354, -1) == 0) return;
    base = data_ov002_022cf16c + (a & 1) * 0x868;
    player = (unsigned char)a;
    q = (struct Bits *)(base + 0x94);
    p = (struct Slot *)(base + 0x64);
    for (i = 5; i <= 10; i++) {
        id = q->id;
        if (id == 0x1354) {
            u32 f = p->w40;
            if (p->h38 & ~((f >> 6) & 1) & ~(((f >> 1) | (f >> 2)) & 1)) {
                if (!((f >> 5) & 1)) {
                    func_ov002_021e2d94(a, i, 5, 1);
                    func_ov002_021d90c0(a, i, 0);
                    func_ov002_021e30b4(((u32)a << 31 & 0x80000000) | 0x3a200000 | (((u32)i << 16) & 0x1f0000) | (u16)id, (u16)(q->idx * 2 + q->flag), player);
                } else {
                    func_ov002_021d90fc(a, i, 1);
                }
            }
        }
        q = (struct Bits *)((char *)q + 0x14);
        p = (struct Slot *)((char *)p + 0x14);
    }
}






