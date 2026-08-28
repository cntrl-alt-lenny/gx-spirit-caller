/* func_ov003_021cecbc: twin of func_ov012_021caea8 (main's func_0201e7ac/
 * func_0201e910/func_0201e798/func_0207fc40 family). 1st param is dead
 * (never read). If a3 != -1, notify func_0201e7ac; always spawn via
 * func_0201e910 with a 2-word fixed-point coord pointer plus an 8-word
 * mostly-zero param block; if a3 == -1, close out via func_0201e798 +
 * func_0207fc40.
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

void func_ov003_021cecbc(int unused0, int a1, Ctx *self, int a3,
                          int a4, int a5, int a6, int a7, int a8, int a9) {
    int coord[2];

    coord[0] = a4 << 12;
    coord[1] = a5 << 12;

    if (a3 != -1) {
        func_0201e7ac(self, a3 & 0xffff);
    }

    func_0201e910(a1, self->field_2c, coord, 0,
                  0, 0, a6, a7, a8, a9, 0, 0);

    if (a3 == -1) {
        func_0201e798(self, 1);
        func_0207fc40(self, 0x1000);
    }
}
