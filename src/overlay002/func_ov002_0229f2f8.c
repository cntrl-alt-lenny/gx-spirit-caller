typedef unsigned int u32;
typedef int s32;

typedef struct {
    s32 pad0;
    s32 pad4;
    s32 kind;
} Obj;

static inline s32 IsA(Obj *o)
{
    return o->kind == 6 || o->kind == 9;
}

static inline s32 IsB(Obj *o)
{
    s32 r = 0;
    u32 d = o->kind - 6;
    if (d <= 9 && ((0x209 & (1 << d)) != 0)) {
        r = 1;
    }
    return r;
}

void func_ov002_0229f2f8(Obj *obj, s32 *a, s32 *b)
{
    *a = IsA(obj) ? 0x30 : 0x20;
    *b = IsB(obj) ? 0x20 : 0x18;
}
