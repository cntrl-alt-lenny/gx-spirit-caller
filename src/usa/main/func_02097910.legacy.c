typedef struct {
    char _pad_0[0x8];
    int field_8;
    char _pad_c[0x4];
    int field_10;
    int field_14;
} Self_t;

extern int func_020964b8(Self_t *self, int a1);
extern void func_02096634(Self_t *self, int a1);
extern int func_020979fc(int a0);
extern void func_02097958(void);

int func_02097910(Self_t *self) {
    int r;
    r = func_020964b8(self, self->field_10);
    func_02096634(self, r);
    if (func_020979fc(self->field_8) != 0) {
        func_02097958();
    }
    return self->field_14 == 0;
}
