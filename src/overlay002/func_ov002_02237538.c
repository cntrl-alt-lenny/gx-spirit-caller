typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 a;
    u16 b : 1;
    u16 pad : 15;
} Obj;

typedef struct {
    u16 v;
    char p[0x12];
} Slot;

typedef struct {
    char pad0[0x38];
    Slot s[5];
    char pad1[0x868 - 0x38 - 5 * 0x14];
} Side;

extern Side data_ov002_022cf16c[];
extern int func_ov002_02218068(Obj *o);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_0202eac8(int a);
extern int func_ov002_021b90a8(int a, int b);
extern void func_ov002_021d5a08(Obj *o, int a, int b, int c, int d, int e);

int func_ov002_02237538(Obj *o)
{
    int r = func_ov002_02218068(o);
    int i;
    if (r == 0) {
        for (i = 0; i <= 4; i++) {
            int t = func_ov002_021b9ecc(o->b, i);
            if (t) {
                if (data_ov002_022cf16c[o->b & 1].s[i].v) {
                    if (func_0202eac8(t)) {
                        if (func_ov002_021b90a8(o->b, i)) {
                            func_ov002_021d5a08(o, o->b, i, o->a, 2, 0);
                        }
                    }
                }
            }
        }
    }
    return r;
}
