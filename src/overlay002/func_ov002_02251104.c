typedef unsigned int u32;
typedef struct { u32 id:13; u32 rest:19; } Ent;
extern char data_ov002_022cf16c[];
typedef struct { u32 count; char pad[0x864]; } Count;
extern Count data_ov002_022cf17c[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8c0(int id);
extern int func_ov002_021b8f80(int arg0);
extern int func_ov002_021bd030(int self);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_02251104(int a) {
    int player = a & 1;
    u32 i = 0;
    Ent *p;
    char *base;
    if (i < data_ov002_022cf17c[player].count) {
        base = data_ov002_022cf16c + (u32)player * 0x868;
        p = (Ent *)(base + 0x260);
        do {
            int id = p->id;
            if (func_0202b878(id) == 0x16 && func_ov002_021b8f80(id) == 0) {
                if (func_ov002_021bd030(a) >= 0 || func_0202b8c0(id) == 2)
                    func_ov002_02253458(a, 13, i);
            }
            i++;
            p++;
        } while (i < *(u32 *)(base + 0x10));
    }
}

