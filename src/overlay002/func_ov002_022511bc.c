typedef unsigned int u32;
typedef struct { u32 id:13; u32 lo:1; u32 mid:8; u32 hi:8; u32 top:2; } Ent;
extern char data_ov002_022cf16c[];
typedef struct { u32 count; char pad[0x864]; } Count;
extern Count data_ov002_022cf17c[];
extern int func_0202b950(int unused0);
extern int func_0202e234(int x);
extern int func_ov002_021ca440(int arg0, int arg1);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_022511bc(int a, int b, u32 limit) {
    int player = a & 1;
    u32 i = 0;
    int id;
    Ent *p;
    char *base;
    if (i < data_ov002_022cf17c[player].count) {
        base = data_ov002_022cf16c + (u32)player * 0x868;
        p = (Ent *)(base + 0x260);
        do {
            id = p->id;
            if (func_0202e234(id) != 0 && (u32)func_0202b950(id) <= limit && func_ov002_021ca440(a, id) != 0) {
                if (func_ov002_021b3fd8(a, 11, 0x12a1, p->hi * 2 + p->lo) == 0)
                    func_ov002_02253458(a, 13, i);
            }
            i++;
            p++;
        } while (i < *(u32 *)(base + 0x10));
    }
}
