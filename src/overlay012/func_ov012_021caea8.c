/* func_ov012_021caea8: twin of func_ov003_021cedf8 -- same
 * func_0201e800/func_0201e964/func_0201e7ec/func_0207fd28 family, but
 * self is looked up from a table by index and the coord pointer (a4) is
 * forwarded from the caller instead of built locally.
 */

extern void func_0201e800(void *p, int lo16);
extern void func_0201e964(int a, int b, void *c, int d,
                           int s0, int s1, int s2, int s3,
                           int s4, int s5, int s6, int s7);
extern void func_0201e7ec(void *p, int value);
extern void func_0207fd28(void *p, int value);

typedef struct {
    char _pad_2c[0x2c];
    int field_2c;
} Ctx;

extern Ctx *data_ov012_021cc7a0[];

void func_ov012_021caea8(int idx, int a1, int a2, int a3, void *a4, int a5) {
    Ctx *self = data_ov012_021cc7a0[idx];

    if (a1 != -1) {
        func_0201e800(self, a1 & 0xffff);
    }

    func_0201e964(1, self->field_2c, a4, 0,
                  0, 0, a3, a2, 0, 0, a5, 0);

    if (a1 == -1) {
        func_0201e7ec(self, 1);
        func_0207fd28(self, 0x1000);
    }
}
