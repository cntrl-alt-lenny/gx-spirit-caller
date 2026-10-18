typedef unsigned int u32;
extern char data_ov002_022cf16c[];
typedef struct { u32 count; char pad[0x864]; } Counts;
extern Counts data_ov002_022cf180[];
extern int func_0202df78(int a, int b);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern void func_ov002_02253458(u32 a, u32 b, u32 c);
typedef struct { u32 id:13; u32 rest:19; } Ent;
void func_ov002_02248e4c(u32 side, u32 kind)
{
    int ids[2];
    u32 i;
    int j;
    Ent *e;
    char *base;


    int id;
    switch (kind) {
    case 0x1294: ids[0] = 0x1291; ids[1] = 0x1293; break;
    case 0x1631: ids[0] = 0xfc9; ids[1] = 0x1377; break;
    }

    i = 0;
    kind = side & 1;
    if (i >= data_ov002_022cf180[kind].count) return;
    base = data_ov002_022cf16c + kind * 0x868;
    e = (Ent *)(base + 0x418);
    do {
        for (j = 0; j < 2; j++) {
            id = ids[j];
            if (func_0202df78(e->id, id) != 0 && func_ov002_021ca3f0(side, id) != 0) {
                func_ov002_02253458(side, 0xe, i);
                break;
            }
        }
        i++;
        e++;
    } while (i < *(u32 *)(base + 0x14));
}










