typedef unsigned int u32;
struct Card { u32 id:13; u32 rest:19; };
extern unsigned int func_0202b8a8(int id);
extern int func_02030808(int id);
extern int func_02030b84(int a0);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
extern char data_ov002_022cf16c[];
struct CountRow { u32 count; char pad[0x864]; };
extern struct CountRow data_ov002_022cf184[];
void func_ov002_0224ca08(int player) {
    u32 i;
    int side = player & 1;
    int off = side * 0x868;
    i = 0;
    if (data_ov002_022cf184[side].count <= i) return;
    {
        struct Card *p;
        char *base = off + data_ov002_022cf16c;
        p = (struct Card *)(base + 0x3a0);
        do {
            int id = p->id;
            if ((int)func_0202b8a8(id) <= 6 && func_02030808(id) && func_02030b84(id) && func_ov002_021ca3f0(player, id))
                func_ov002_02253458(player, 12, i);
            i++;
            p++;
        } while (i < *(u32 *)(base + 0x18));
    }
}


