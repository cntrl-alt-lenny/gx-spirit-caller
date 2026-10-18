typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef int s32;

typedef struct {
    u16 a;
    u16 side : 1;
    u16 rest : 15;
} Arg;

extern s32 func_ov002_0227d82c(u32 side, s32 b);
extern s32 func_ov002_021c8470(s32 a, s32 b);

s32 func_ov002_022936e0(Arg *p)
{
    s32 v = func_ov002_0227d82c(p->side, 0);

    if (v == -1) {
        return 0;
    }
    return func_ov002_021c8470(v & 0xff, ((u16)v >> 8) & 0xff) < 0x8fc;
}
