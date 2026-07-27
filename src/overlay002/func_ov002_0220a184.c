/* func_ov002_0220a184: r = func_ov002_021c2f24(p->f0,p->h0); t = cf17c
 * table[p->f0]; return (unsigned)t >= r+1. */

typedef unsigned short u16;
typedef unsigned int   u32;
typedef int            s32;

struct Obj_0220a184 {
    u16 h0;
    u16 f0 : 1;
    u16 pad2 : 15;
};

extern char data_ov002_022cf17c[];
extern u32 func_ov002_021c2f24(u32 a, u32 b);

s32 func_ov002_0220a184(struct Obj_0220a184 *p)
{
    u32 r;
    s32 t;
    r = func_ov002_021c2f24(p->f0, p->h0);
    t = *(s32 *)(data_ov002_022cf17c + (p->f0 & 1) * 0x868);
    return (u32)t >= r + 1;
}
