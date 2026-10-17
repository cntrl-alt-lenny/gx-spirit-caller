typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 pad0;
    u16 side : 1;
    u16 pad1 : 5;
    u16 kind : 6;
    u16 pad2 : 4;
} Obj;

typedef struct {
    u32 v;
    char pad[0x864];
} Ent;

extern Ent data_ov002_022cf188[];

int func_ov002_022074dc(Obj *obj)
{
    if (obj->kind == 0x23) {
        return 1;
    }
    return data_ov002_022cf188[obj->side & 1].v >= 7;
}
