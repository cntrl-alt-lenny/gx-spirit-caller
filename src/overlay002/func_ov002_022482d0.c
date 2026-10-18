typedef unsigned int u32;

extern char data_ov002_022cf16c[];
extern u32 data_ov002_022cf17c[];

extern int func_0202e234(u32 id);
extern int func_0202b950(u32 id);
extern int func_ov002_021b3fd8(u32 a, u32 b, u32 c, u32 d);
extern void func_ov002_02253458(u32 a, u32 b, u32 c);

typedef struct {
    u32 id : 13;
    u32 bit : 1;
    u32 mid : 8;
    u32 hi : 8;
    u32 rest : 2;
} Ent;

void func_ov002_022482d0(u32 side)
{
    u32 i = 0;
    u32 off = (side & 1) * 0x868;
    Ent *e;
    char *base;

    if (i >= *(u32 *)((char *)data_ov002_022cf17c + off)) {
        return;
    }
    base = data_ov002_022cf16c + off;
    e = (Ent *)(base + 0x260);
    do {
        if (func_0202e234(e->id) != 0 && func_0202b950(e->id) <= 0x5dc) {
            if (func_ov002_021b3fd8(side, 0xb, 0x12a1, e->hi * 2 + e->bit) == 0) {
                func_ov002_02253458(side, 0xd, i);
            }
        }
        i++;
        e++;
    } while (i < *(u32 *)(base + 0x10));
}
