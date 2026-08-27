/* func_02070b9c: run func_020917e8, then dispatch on self->field_8: 3 or
 * 4 re-arms via func_02072288 (setting field_8=7); any other non-zero
 * value runs func_0207229c; zero does nothing further. */

typedef struct {
    unsigned char _pad_00[0x8];
    unsigned char field_8;
} Self_02070c84_t;

extern void func_020917e8(void);
extern void func_02072288(Self_02070c84_t *self, int code);
extern void func_0207229c(Self_02070c84_t *self, int code);

void func_02070b9c(Self_02070c84_t *self) {
    unsigned char v;
    func_020917e8();
    v = self->field_8;
    if (v == 3 || v == 4) {
        func_02072288(self, 0x19);
        self->field_8 = 7;
    } else if (v != 0) {
        func_0207229c(self, 0x1a);
    }
}
