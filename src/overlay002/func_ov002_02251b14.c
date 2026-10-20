typedef unsigned int u32;
typedef struct { u32 id:13; u32 rest:19; } Ent;
typedef struct { u32 count; char pad[0x864]; } Count;
extern char data_ov002_022cf16c[];
extern Count data_ov002_022cf17c[];
extern int func_0202ed90(int a0);
extern unsigned int func_0202b8a8(int id);
extern void func_ov002_02253458(int a, int b, int c);
void func_ov002_02251b14(int a, int unused, u32 limit) {
    int player = a & 1;
    u32 i = 0;
    Ent *p;
    char *base;
    if (i < data_ov002_022cf17c[player].count) {
        base = data_ov002_022cf16c + (u32)player * 0x868;
        p = (Ent *)(base + 0x260);
        do {
            u32 id = p->id;
            if (func_0202ed90(id) != 0 && func_0202b8a8(id) <= limit)
                func_ov002_02253458(a, 13, i);
            i++;
            p++;
        } while (i < *(u32 *)(base + 0x10));
    }
}
