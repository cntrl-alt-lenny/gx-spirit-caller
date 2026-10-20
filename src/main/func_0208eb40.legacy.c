struct Vec { int x, y, z; };
extern void func_0208c1a0(int *v, int *out);
extern void func_0208c348(struct Vec *a, struct Vec *b, struct Vec *out);
extern int func_0208c3e4(struct Vec *a, struct Vec *b);
void func_0208eb40(struct Vec *eye, struct Vec *up, struct Vec *target, int load, int *out)
{
    struct Vec f, s, u;
    int tx, ty, tz;
    volatile int *port;
    f.x = eye->x - target->x;
    f.y = eye->y - target->y;
    f.z = eye->z - target->z;
    func_0208c1a0((int *)&f, (int *)&f);
    func_0208c348(up, &f, &s);
    func_0208c1a0((int *)&s, (int *)&s);
    func_0208c348(&f, &s, &u);
    if (load) {
        *(volatile int *)0x04000440 = 2;
        port = (volatile int *)0x0400045c;
        *port = s.x;
        *port = u.x;
        *port = f.x;
        *port = s.y;
        *port = u.y;
        *port = f.y;
        *port = s.z;
        *port = u.z;
        *port = f.z;
    }
    tx = -func_0208c3e4(eye, &s);
    ty = -func_0208c3e4(eye, &u);
    tz = -func_0208c3e4(eye, &f);
    if (load) {
        *port = tx;
        *port = ty;
        *port = tz;
    }
    if (out) {
        out[0] = s.x; out[1] = u.x; out[2] = f.x;
        out[3] = s.y; out[4] = u.y; out[5] = f.y;
        out[6] = s.z; out[7] = u.z; out[8] = f.z;
        out[9] = tx; out[10] = ty; out[11] = tz;
    }
}


