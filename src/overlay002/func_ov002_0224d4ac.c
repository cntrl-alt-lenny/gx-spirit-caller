typedef unsigned int u32;

typedef struct {
    u32 pad[0x1c / 4];
    u32 count;
    char rest[0x868 - 0x20];
} Ent;

extern Ent data_ov002_022cf16c[];
extern u32 data_ov002_022cf188[];
extern void func_ov002_02253458(u32 a, u32 b, u32 c);

void func_ov002_0224d4ac(u32 a)
{
    u32 i = 0;
    u32 idx = a & 1;
    Ent *p;
    u32 n = *(u32 *)((char *)data_ov002_022cf188 + idx * 0x868);

    if (i < n) {
        p = &data_ov002_022cf16c[idx];
        do {
            func_ov002_02253458(a, 0xf, i);
            i++;
        } while (i < p->count);
    }
}
