typedef unsigned short u16;
typedef unsigned int u32;
struct S022068c4 {
    u16 f0;
    u16 bit0 : 1;
    u16 pad : 5;
    u16 type : 6;
    u16 rest : 4;
    u32 f4;
    u32 f8;
    u32 fc;
    u32 f10;
    u32 idx : 9;
    u32 b9 : 1;
    u32 p1 : 4;
    u32 b14 : 1;
    u32 p2 : 4;
    u32 kind : 4;
    u32 rest2 : 9;
};
struct E022d0250 { u16 v : 13; u16 r : 3; u16 x; };
extern struct E022d0250 data_ov002_022d0250[];
extern int func_0202e234(int v);

int func_ov002_022068c4(struct S022068c4 *self) {
    if (self->type == 0x16) {
        if (self->b9 == self->bit0) return 0;
        if (!self->b14) return 0;
        if (self->kind != 0xe) return 0;
        return func_0202e234(data_ov002_022d0250[self->idx].v) != 0;
    }
    return 0;
}
