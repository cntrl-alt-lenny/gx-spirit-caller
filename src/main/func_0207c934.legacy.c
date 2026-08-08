typedef struct {
    char pad_00[0x8];
    void *field_8;
    int field_c;
} Obj_0207c934;

extern void func_01ff8180(void);
extern void func_02091a0c(Obj_0207c934 *a0);

void func_0207c934(Obj_0207c934 *a0) {
    if (a0->field_8 != (void *)func_01ff8180) {
        return;
    }
    a0->field_c = a0->field_c - 1;
    if (a0->field_c != 0) {
        return;
    }
    a0->field_8 = 0;
    func_02091a0c(a0);
}
