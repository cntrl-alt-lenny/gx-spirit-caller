typedef unsigned int u32;
typedef unsigned short u16;
typedef int s32;

struct Hdr {
    u16 w0;
    u16 b0 : 1;
    u16 mid : 15;
    u16 p0 : 2;
    u16 b2 : 1;
    u16 rest : 13;
};

struct Row {
    s32 w;
    char pad[0x864];
};

struct Ent {
    u32 lo : 13;
    u32 rest : 19;
};

extern s32 data_ov002_022ce288[];
extern struct Row data_ov002_022cf184[];
extern void func_ov002_021ae400(s32 a, s32 b);
extern void func_ov002_021af9d0(s32 a, s32 b, s32 c, s32 d);
extern struct Ent *func_ov002_021afb74(void);
extern void func_ov002_021e16a4(s32 a, s32 b, s32 c, s32 d);

s32 func_ov002_02212a54(struct Hdr *arg)
{
    if (arg->b2) {
        return 0;
    }
    switch (data_ov002_022ce288[0x5a8 / 4]) {
    case 0x80:
        if (data_ov002_022cf184[arg->b0 & 1].w == 0) {
            return 0;
        }
        func_ov002_021ae400(arg->b0, 0x1b);
        return 0x7f;
    case 0x7f:
        func_ov002_021af9d0(arg->b0, 6, arg->w0, 0);
        return 0x7e;
    case 0x7e: {
        s32 lo = func_ov002_021afb74()->lo;
        s32 z = 0;
        func_ov002_021e16a4(arg->b0, lo, z, z);
        return 0;
    }
    }
    return 0;
}
