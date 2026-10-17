typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 a;
    u16 flag : 1;
    u16 rest : 15;
    u32 pad[5];
} Req;

extern int func_ov002_021de134(Req *r, u32 mask, int c, int d);

int func_ov002_021dea48(int p, int slot, int q, u16 val) {
    Req r = {0};
    u32 mask = 1 << (slot + p * 16);
    r.a = val;
    r.flag = (u16)(p ^ q);
    return (func_ov002_021de134(&r, mask, 13, 0) & mask) != 0;
}
