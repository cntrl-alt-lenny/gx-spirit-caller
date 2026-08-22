typedef struct {
    char pad_00[0x14];
    int field_14;
} P5_t;

typedef struct {
    int field_0;
    int field_4;
    int field_8;
    int field_c;
} P4_t;

typedef struct {
    char pad_00[0x10];
    P4_t *field_10;
    P5_t *field_14;
} A0_t;

extern void func_02098388(void *obj);
extern int func_020977c0(void *a, int b);
extern int func_02098104(void *self, int a1, int a2, int a3, int a4);
extern int func_02097f10(void *self, int b, int c);
extern int func_02097ff0(void *self);

int func_020a0e9c(A0_t *a0) {
    P4_t *p4 = a0->field_10;
    P5_t *p5 = a0->field_14;
    char local[0x48];
    int node;
    int fc;
    int v0;

    func_02098388(local);
    v0 = p4->field_0;
    node = func_020977c0((char *)p5 + 0x10, p5->field_14);
    if (func_02098104(local, node, v0, v0 + p4->field_4, -1) != 0) {
        if (func_02097f10(local, p4->field_8, p4->field_4) == p4->field_4) {
            p4->field_c = 2;
        }
        func_02097ff0(local);
    }
    fc = p4->field_c;
    if (fc != 2) {
        p4->field_0 = 0;
        fc = 2;
        p4->field_c = fc;
    }
    return fc;
}
