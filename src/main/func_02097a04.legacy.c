typedef struct {
    char _pad_0[0x8];
    int field_8;
    char _pad_c[0x4];
    int field_10;
    int field_14;
} Self_t;

extern int func_020965ac(Self_t *self, int a1);
extern void func_02096728(Self_t *self, int a1);
extern int func_02097af0(int a0);
extern void func_02097a4c(void);

int func_02097a04(Self_t *self) {
    int r;
    r = func_020965ac(self, self->field_10);
    func_02096728(self, r);
    if (func_02097af0(self->field_8) != 0) {
        func_02097a4c();
    }
    return self->field_14 == 0;
}
