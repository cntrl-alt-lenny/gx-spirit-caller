typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; u16 idx : 5; u16 rest : 10; };
struct Ent { u16 v; char pad[0x12]; };
struct Grp { struct Ent e[106]; char pad[0x20]; };

extern struct Grp data_ov002_022cf1a2[];
extern int func_ov002_02259f74(int x);
extern int func_ov002_0227d660(int x, int y);

int func_ov002_0229205c(struct Self *self) {
    if (func_ov002_02259f74(self->b0) == 0) return 0;
    {
        int a = self->b0;
        int i = self->idx;
        if (data_ov002_022cf1a2[a & 1].e[i].v != 0) return 0;
        return func_ov002_0227d660(a, 0) >= 0;
    }
}
