/* func_02070c84: run func_020918d0, then dispatch on self->field_8: 3 or
 * 4 re-arms via func_02072370 (setting field_8=7); any other non-zero
 * value runs func_02072384; zero does nothing further. */

typedef struct {
    unsigned char _pad_00[0x8];
    unsigned char field_8;
} Self_02070c84_t;

extern void func_020918d0(void);
extern void func_02072370(Self_02070c84_t *self, int code);
extern void func_02072384(Self_02070c84_t *self, int code);

void func_02070c84(Self_02070c84_t *self) {
    unsigned char v;
    func_020918d0();
    v = self->field_8;
    if (v == 3 || v == 4) {
        func_02072370(self, 0x19);
        self->field_8 = 7;
    } else if (v != 0) {
        func_02072384(self, 0x1a);
    }
}
