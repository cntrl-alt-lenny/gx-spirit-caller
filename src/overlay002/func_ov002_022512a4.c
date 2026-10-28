typedef unsigned int u32;
typedef struct { u32 id:13; u32 lo:1; u32 mid:8; u32 hi:8; u32 top:2; } Ent;
extern char data_ov002_022cf16c[];
typedef struct { u32 count; char pad[0x864]; } Count;
extern Count data_ov002_022cf17c[];
extern unsigned int func_0202b878(int id);
extern int func_0202b950(int unused0);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_022512a4(int a, int b) {
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
            if (func_0202b878(id) == func_0202b878(b) && func_0202b950(id) <= 0x5dc) {
                if (func_ov002_021b3fd8(a, 11, 0x12a1, p->hi * 2 + p->lo) == 0)
                    func_ov002_02253458(a, 13, i);
            }
            i++;
            p++;
        } while (i < *(u32 *)(base + 0x10));
    }
}

