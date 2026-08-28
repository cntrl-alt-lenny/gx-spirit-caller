/* func_0206b648: pass v to func_020688f0 along with self's previous
 * field_5d0 value (or 0 if it was unset), then store v into field_5d0. */

extern void func_020688f0(void *p, int value);

typedef struct {
    unsigned char _pad_00[0x5d0];
    void *field_5d0;
} Self_0206b6bc_t;

void func_0206b648(Self_0206b6bc_t *self, void *v) {
    void *flag = self->field_5d0;
    if (flag == 0) {
        func_020688f0(v, 0);
    } else {
        func_020688f0(v, (int)flag);
    }
    self->field_5d0 = v;
}
