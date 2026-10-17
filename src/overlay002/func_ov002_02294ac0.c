typedef unsigned short u16;
typedef unsigned int u32;
typedef int s32;

typedef struct {
    u16 a;
    u16 side : 1;
    u16 rest : 15;
} Arg;

extern s32 func_ov002_02280980(u32 side);
extern s32 func_ov002_022577dc(Arg *p);
extern s32 func_ov002_022536e8(u32 side, u16 a, s32 c);

s32 func_ov002_02294ac0(Arg *p)
{
    s32 v;

    if (func_ov002_02280980(p->side) >= 0) {
        return 0;
    }
    v = func_ov002_022577dc(p);
    return v <= func_ov002_022536e8(p->side, p->a, 0);
}
