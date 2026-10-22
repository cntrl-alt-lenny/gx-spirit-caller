typedef unsigned int u32;
typedef struct { u32 id:13; u32 rest:19; } Ent;
typedef struct { u32 count; char pad[0x864]; } Count;
extern char data_ov002_022cf16c[];
extern Count data_ov002_022cf17c[];
extern int func_0202e234(int x);
extern int func_0202de9c(int unused0);
extern int func_0202eac8(int id);
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_02251908(int a) {
    int player = a & 1;
    u32 i = 0;
    Ent *p;
    char *base;
    if (i < data_ov002_022cf17c[player].count) {
        base = data_ov002_022cf16c + (u32)player * 0x868;
        p = (Ent *)(base + 0x260);
        do {
            u32 id = p->id;
            if (func_0202e234(id) != 0 && func_0202de9c(id) == 0 && func_0202eac8(id) != 0 && func_ov002_021ca440(a, id) != 0)
                func_ov002_02253458(a, 13, i);
            i++;
            p++;
        } while (i < *(u32 *)(base + 0x10));
    }
}
