typedef long long s64;
struct Obj { int flags; char pad[0x2c]; int sx; int sy; };
struct Matrix { int v[14]; };
struct Command { int cmd; int mode; struct Matrix m; int zero; int scale; int type; };
extern void (*data_02102380[8])(struct Matrix *, struct Obj *);
extern void func_02084e0c(int cmd, void *src, int n);
void func_02086464(struct Obj *p)
{
    struct Command c;
    int zero = 0;
    if (p->flags & 8) c.cmd = 0x101610;
    else c.cmd = 0x101810;
    c.mode = 3;
    c.type = 2;
    c.m.v[2] = c.m.v[3] = c.m.v[6] = c.m.v[7] = c.m.v[8] = c.m.v[9] = c.m.v[10] = c.m.v[11] = c.zero = 0;
    c.scale = 0x1000;
    data_02102380[p->flags & 7](&c.m, p);
    if (p->sx != 0x1000) {
        c.m.v[0] = (int)(((s64)p->sx * c.m.v[0]) >> 12);
        c.m.v[1] = (int)(((s64)p->sx * c.m.v[1]) >> 12);
        c.m.v[12] = (int)(((s64)p->sx * c.m.v[12]) >> 12);
    }
    if (p->sy != 0x1000) {
        c.m.v[4] = (int)(((s64)p->sy * c.m.v[4]) >> 12);
        c.m.v[5] = (int)(((s64)p->sy * c.m.v[5]) >> 12);
        c.m.v[13] = (int)(((s64)p->sy * c.m.v[13]) >> 12);
    }
    func_02084e0c(c.cmd, (int *)&c + 1, 0x12);
}








