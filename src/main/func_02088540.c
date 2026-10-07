typedef unsigned char u8;

struct Obj { char pad0[0x44]; int f44; int f48; u8 f4c[1]; };

extern int func_020873fc(int mask);

int func_02088540(struct Obj *o, int n, u8 *src)
{
    int i;
    int mask = 0;
    for (i = 0; i < n; i++) {
        o->f4c[i] = src[i];
        mask |= 1 << src[i];
    }
    if (func_020873fc(mask) == 0) {
        return 0;
    }
    o->f48 = n;
    o->f44 = mask;
    return 1;
}
