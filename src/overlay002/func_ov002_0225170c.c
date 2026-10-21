typedef unsigned int u32;
typedef struct { u32 id:13; u32 rest:19; } Ent;
typedef struct { u32 count; char pad[0x864]; } Count;
extern char data_ov002_022cf16c[];
extern Count data_ov002_022cf180[];
extern int func_0202e234(int x);
extern int func_0202ed90(int a0);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_0225170c(int a) {
    int player = a & 1;
    u32 i = 0;
    Ent *p;
    char *base;
    if (i < data_ov002_022cf180[player].count) {
        base = data_ov002_022cf16c + (u32)player * 0x868;
        p = (Ent *)(base + 0x418);
        do {
            u32 id = p->id;
            if (func_0202e234(id) != 0 && func_0202ed90(id) != 0 && func_ov002_021c33e4(a, a, i) != 0)
                func_ov002_02253458(a, 14, i);
            i++;
            p++;
        } while (i < *(u32 *)(base + 0x14));
    }
}
