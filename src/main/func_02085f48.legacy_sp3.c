typedef long long s64;
typedef unsigned short u16;
struct Src { unsigned flags; int pad[5]; int sx, sy; int pad20; int x,y; u16 w,h; int ax,ay; };
struct Command { int cmd; int m[14]; };
extern void func_02084e0c(int cmd, void *src, int n);
void func_02085f48(struct Src *s)
{
    int c[15];
    if (s->flags & 8) c[0] = 0x00101710;
    else c[0] = 0x00101910;
    c[1] = 3; c[13] = 0;
    c[14] = 2;
    c[10] = 0; c[9] = 0; c[8] = 0; c[7] = 0; c[5] = 0; c[4] = 0; c[3] = 0;

    if (s->flags & 4) {
        c[11] = 0; c[12] = 0;
        if (s->flags & 1) {
            c[2] = 0x1000; c[6] = 0x1000;
        } else {
            c[2] = s->sx;
            c[6] = s->sy;
        }
    } else if (s->flags & 1) {
        c[11] = -(s->x << 4) * s->w;
        c[12] = -(s->y << 4) * s->h;
        c[2] = 0x1000; c[6] = 0x1000;
    } else {
        c[11] = -(int)(((s64)s->sx * s->x) >> 8) * s->w;
        c[12] = -(int)(((s64)s->sy * s->y) >> 8) * s->h;
        c[2] = s->sx;
        c[6] = s->sy;
    }
    if (s->ax != 0x1000) {
        c[2] = (int)(((s64)s->ax * c[2]) >> 12);
        c[11] = (int)(((s64)s->ax * c[11]) >> 12);
    }
    if (s->ay != 0x1000) {
        c[6] = (int)(((s64)s->ay * c[6]) >> 12);
        c[12] = (int)(((s64)s->ay * c[12]) >> 12);
    }
    func_02084e0c(c[0], (int *)&c + 1, 14);
}




