typedef unsigned int u32;
struct Card { u32 id:13; u32 rest:19; };
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8a8(int id);
extern int func_0202e234(int x);
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
extern char data_ov002_022cf16c[];
struct CountRow { u32 count; char pad[0x864]; };
extern struct CountRow data_ov002_022cf17c[];
void func_ov002_0224c8c4(int player) {
    u32 i;
    int side = player & 1;
    int off = side * 0x868;
    i = 0;
    if (data_ov002_022cf17c[side].count <= i) return;
    {
        struct Card *p;
        char *base = off + data_ov002_022cf16c;
        p = (struct Card *)(base + 0x260);
        do {
            int id = p->id;
            if (func_0202e234(id) && (int)func_0202b8a8(id) <= 2 && func_0202b878(id) == 0x12 && func_ov002_021ca440(player, id))
                func_ov002_02253458(player, 13, i);
            i++;
            p++;
        } while (i < *(u32 *)(base + 0x10));
    }
}




