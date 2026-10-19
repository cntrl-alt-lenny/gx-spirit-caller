typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 value; u16 kind:4; u16 rest:12; u16 unused; u16 next; } Link;
typedef struct { u32 id:13; u32 rest:19; u32 pad; u16 mask; u16 pad2; u32 pad3; u32 flags; } Card;
extern char data_ov002_022cf16c[];
extern u16 data_ov002_022cf1a6[];
extern Link data_ov002_022d0650[];
extern int func_ov002_021b3e28(int arg0, int arg1, int arg2);
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
extern int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3);
void func_ov002_021d94ac(int a, int b, int c, int d)
{
    int v = func_ov002_021b3e28(a,b,d);
    u16 n;
    func_ov002_021d479c((a != 0 ? 0x8000 : 0) | 0x3c, b, (short)c, d);
    if (d != 0x1a90) return;
    if (v + c > 0) return;
    n = *(u16 *)((char *)data_ov002_022cf1a6 + (a & 1) * 0x868 + b * 0x14);
    while (n != 0) {
        Link *p = &data_ov002_022d0650[n];
        int kind = p->kind;
        n = p->next;
        if (kind == 7) {
            int player = (unsigned char)p->value;
            int row = (unsigned char)(p->value >> 8);
            Card *q = (Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + row * 0x14 + 0x30);
            if (q->id == 0x1a9c) {
                u32 f = q->flags;
                u16 h = q->mask;
                if (h & ~((f >> 6) & 1) & ~(((f >> 1) | (f >> 2)) & 1)) {
                    func_ov002_021de480(player,row,0,0);
                }
            }
        }
    }
}

