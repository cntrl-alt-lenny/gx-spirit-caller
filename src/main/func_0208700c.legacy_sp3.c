typedef long long s64;
typedef struct {
    int pad[6];
    int x, y;
    short s, c;
    int tx, ty;
    unsigned short w, h;
} Transform;
extern void func_0208be38(int a0, int a1);
extern int func_0208bed8(void);
void func_0208700c(int *out, Transform *p)
{
    int w = p->w << 12;
    int h = p->h << 12;
    int xs, yc;
    int x, y, sn, c;
    s64 a, b;
    int t, tx, ty, width;
    func_0208be38(h, w);
    c = p->c;
    x = p->x;
    sn = p->s;
    y = p->y;
    out[0] = (s64)x * c >> 12;
    xs = (s64)x * sn >> 12;
    yc = (s64)y * c >> 12;
    out[5] = yc;
    out[1] = ((int)((s64)y * sn >> 12) * func_0208bed8()) >> 12;
    func_0208be38(w, h);
    b = ((s64)p->tx * p->c + (s64)p->ty * p->s) >> 12;
    a = ((s64)p->tx * p->s - (s64)p->ty * p->c) >> 12;
    t = yc + (int)((a * p->y) >> 12) - 0x1000;
    out[12] = (p->w * (xs - (int)((b * p->x) >> 12))) << 4;
    out[13] = (-p->h * t) << 4;
    out[4] = (-xs * func_0208bed8()) >> 12;
}







