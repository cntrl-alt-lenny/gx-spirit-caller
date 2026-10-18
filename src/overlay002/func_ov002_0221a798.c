typedef unsigned short u16;
typedef unsigned int u32;

struct Duel {
    char pad0[0xcec];
    u32 f_cec;
    char padcf0[8];
    u32 f_cf8;
};

struct Arg {
    u16 id;
    u16 side : 1;
    u16 rest : 15;
    u16 rest2 : 6;
    u16 val : 9;
    u16 pad : 1;
};

extern struct Duel data_ov002_022d016c;
extern void func_ov002_021e276c(u32 a, u32 b, u16 c, u32 d);

int func_ov002_0221a798(struct Arg *p, u32 unused1, u32 unused2, u32 v)
{
    u32 h = p->id;

    switch (h) {
    case 0x137e:
        if (p->side == data_ov002_022d016c.f_cec) {
            v = (data_ov002_022d016c.f_cf8 >= 1) << 1;
        } else {
            v = 1;
        }
        break;
    case 0x14fd:
        v = (p->side == data_ov002_022d016c.f_cec) + 1;
        break;
    }
    {
        unsigned char t = v & 0xf;
        func_ov002_021e276c(p->side, h, (t << 4) | 1, p->val);
    }
    return 0;
}
