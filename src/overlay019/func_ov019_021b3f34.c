typedef unsigned short u16;
struct P021b3f34 {
    u16 f0;
    u16 f2;
    u16 gap4;
    u16 f6;
    u16 f8;
    u16 gap10;
};
extern void func_ov019_021b3e38(int a0, int a1, int a2, void *p);
void func_ov019_021b3f34(int a0, int a1, int a2, struct P021b3f34 *p, int x, int y) {
    struct P021b3f34 local;
    local.f0 = p->f0 + x;
    local.f2 = p->f2 + y;
    local.f6 = p->f6;
    local.f8 = p->f8;
    func_ov019_021b3e38(a0, a1, a2, &local);
}
