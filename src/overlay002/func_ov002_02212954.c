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

extern s32 data_ov002_022cd744[];
extern s32 data_ov002_022ce288[];
extern struct Row data_ov002_022cf178[];
extern s32 data_ov002_022d016c[];
extern void func_ov002_021ae484(s32 a);
extern void func_ov002_021d71e0(s32 a, s32 b, s32 c);
extern void func_ov002_0221292c(void);
extern void func_ov002_022592ec(void *fn);
extern s32 func_ov002_022593f4(void);

s32 func_ov002_02212954(struct Hdr *arg)
{
    if (arg->b2) {
        return 0;
    }
    if (data_ov002_022cd744[arg->b0] == 1) {
        return 0;
    }
    switch (data_ov002_022ce288[0x5a8 / 4]) {
    case 0x80:
        if (data_ov002_022cf178[arg->b0 & 1].w == 0) {
            return 0;
        }
        func_ov002_021ae484(0x1e);
        return 0x7f;
    case 0x7f:
        if (data_ov002_022d016c[0xd44 / 4] == 0) {
            return 0;
        }
        func_ov002_022592ec(func_ov002_0221292c);
        return 0x7e;
    case 0x7e:
        if (func_ov002_022593f4() != 0) {
            func_ov002_021d71e0(arg->b0, data_ov002_022d016c[0xd78 / 4], 0);
        }
        return 0x80;
    }
    return 0;
}
