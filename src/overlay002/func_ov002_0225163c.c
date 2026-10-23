typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { u16 id; u16 kind:4; u16 rest:12; u16 card; u16 next; } Entry;
extern char data_ov002_022cf1a6[];
extern Entry data_ov002_022d0650[];
extern u32 func_ov002_021b947c(int card);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_0225163c(int a, int b, int c) {
    u16 n = *(u16 *)(data_ov002_022cf1a6 + (a & 1) * 0x868 + c * 20);
    while (n != 0) {
        Entry *p = &data_ov002_022d0650[n];
        n = p->next;
        if (p->kind < 6 && p->id == b) {
            u32 v = func_ov002_021b947c(p->card);
            if ((u8)((u16)v >> 8) == 14) {
                u8 player = v;
                u16 idx = v >> 16;
                if (func_ov002_021c33e4(a, player, idx) != 0)
                    func_ov002_02253458(player, 14, idx);
            }
        }
    }
}
