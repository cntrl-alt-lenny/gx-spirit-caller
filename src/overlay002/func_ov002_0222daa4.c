struct A0_t {
    unsigned short field_0;
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

extern int func_ov002_0225764c(struct A0_t *a0, int a1, int a2);
extern int func_ov002_021b3ecc(int a0, int a1, unsigned short a2);
extern int func_ov002_021d5a08(struct A0_t *a0, int a1, int a2, unsigned short a3, unsigned short a4, unsigned short a5);
extern void func_ov002_021e276c(int bit, int f0, int a, int b);

int func_ov002_0222daa4(struct A0_t *a0) {
    int i, j;

    for (i = 0; i < 2; i++) {
        for (j = 0; j < 5; j++) {
            if (func_ov002_0225764c(a0, i, j) == 0) {
                continue;
            }
            if (func_ov002_021b3ecc(i, j, a0->field_0) != 0) {
                continue;
            }
            func_ov002_021d5a08(a0, i, j, a0->field_0, 2, 0);
        }
    }
    func_ov002_021e276c(a0->bit0, a0->field_0, 1, 0);
    return 0;
}
