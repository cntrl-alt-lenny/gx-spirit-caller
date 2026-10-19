typedef long long s64;
struct Obj { int flags; int pos[3]; int scale[3]; int origin[3]; int matrix[9]; int factor[3]; };
extern void func_02084e0c(int cmd, void *src, int n);
void func_02086334(struct Obj *p)
{
    int v[3];
    int special = 0;
    int mask = p->flags & 0x18;
    if (mask == 0) func_02084e0c(0x1b, p->origin, 3);
    if (!(p->flags & 4)) {
        if (mask != 0) special = 1;
        else {
            v[0] = (int)(((s64)p->factor[0] * p->scale[0]) >> 12);
            v[1] = (int)(((s64)p->factor[1] * p->scale[1]) >> 12);
            v[2] = (int)(((s64)p->factor[2] * p->scale[2]) >> 12);
            func_02084e0c(0x1c, v, 3);
        }
    }
    if (!(p->flags & 2)) {
        if (special) func_02084e0c(0x19, p->matrix, 0xc);
        else func_02084e0c(0x1a, p->matrix, 9);
    } else {
        if (special) func_02084e0c(0x1c, p->factor, 3);
    }
    if (mask == 0) func_02084e0c(0x1b, p->scale, 3);
    if (!(p->flags & 1)) func_02084e0c(0x1b, p->pos, 3);
}
