typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 a;
    u16 b;
    u16 c;
    u16 n0 : 8;
    u16 n : 8;
} Arg;

typedef struct {
    u32 v : 13;
} Ent;

extern char data_ov002_022cf16c[];

extern int func_ov002_0223df38(Arg *, int, int *);
extern int func_ov002_021c2084(Arg *, int, int, int);
extern int func_ov002_021de8fc(Arg *, int, int);

int func_ov002_02233504(Arg *arg)
{
    int i;
    int mask = 0;
    i = mask;
    int v;
    int lo, hi;

    for (; i < arg->n; i++) {
        if (func_ov002_0223df38(arg, i, &v) == 0) {
            continue;
        }
        lo = v & 0xff;
        hi = (((u16)v) >> 8) & 0xff;
        if (((Ent *)(data_ov002_022cf16c + (lo & 1) * 0x868 + hi * 0x14 + 0x30))->v == 0) {
            continue;
        }
        if (func_ov002_021c2084(arg, lo, hi, 1) != 0) {
            mask |= 1 << (hi + (lo << 4));
        }
    }
    func_ov002_021de8fc(arg, mask, 2);
    return 0;
}
