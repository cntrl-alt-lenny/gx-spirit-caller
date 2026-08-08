/* func_0206b6bc: pass v to func_02068964 along with self's previous
 * field_5d0 value (or 0 if it was unset), then store v into field_5d0. */

extern void func_02068964(void *p, int value);

typedef struct {
    unsigned char _pad_00[0x5d0];
    void *field_5d0;
} Self_0206b6bc_t;

void func_0206b6bc(Self_0206b6bc_t *self, void *v) {
    void *flag = self->field_5d0;
    if (flag == 0) {
        func_02068964(v, 0);
    } else {
        func_02068964(v, (int)flag);
    }
    self->field_5d0 = v;
}
