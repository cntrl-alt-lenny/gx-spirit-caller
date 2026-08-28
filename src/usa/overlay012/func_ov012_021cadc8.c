/* func_ov012_021cadc8: twin of func_ov003_021cedf8 -- same
 * func_0201e7ac/func_0201e910/func_0201e798/func_0207fc40 family, but
 * self is looked up from a table by index and the coord pointer (a4) is
 * forwarded from the caller instead of built locally.
 */

extern void func_0201e7ac(void *p, int lo16);
extern void func_0201e910(int a, int b, void *c, int d,
                           int s0, int s1, int s2, int s3,
                           int s4, int s5, int s6, int s7);
extern void func_0201e798(void *p, int value);
extern void func_0207fc40(void *p, int value);

typedef struct {
    char _pad_2c[0x2c];
    int field_2c;
} Ctx;

extern Ctx *data_ov012_021cc6c0[];

void func_ov012_021cadc8(int idx, int a1, int a2, int a3, void *a4, int a5) {
    Ctx *self = data_ov012_021cc6c0[idx];

    if (a1 != -1) {
        func_0201e7ac(self, a1 & 0xffff);
    }

    func_0201e910(1, self->field_2c, a4, 0,
                  0, 0, a3, a2, 0, 0, a5, 0);

    if (a1 == -1) {
        func_0201e798(self, 1);
        func_0207fc40(self, 0x1000);
    }
}
