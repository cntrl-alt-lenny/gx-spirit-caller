struct Obj { int f0; int pad4; unsigned f8; char pad[0xd4]; int fe0; int fe4; };
struct V3 { int x, y, z; };

extern void func_02084e0c(int id, struct V3 *v, int n);

void func_02082f64(struct Obj *o, int flag)
{
    unsigned f = o->f8;
    if (!(f & 0x100) && !(f & 0x200)) {
        struct V3 v;
        if (flag == 0) {
            v.x = v.y = v.z = o->fe0;
        } else {
            v.x = v.y = v.z = o->fe4;
        }
        func_02084e0c(0x1b, &v, 3);
    }
    o->f0 += 1;
}
