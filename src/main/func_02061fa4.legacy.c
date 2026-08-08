/* func_02061fa4: one-shot state-transition guard. If self->field_c != 7,
 * set it to 7 and fire two teardown-ish calls, each taking the address
 * of the (stack-homed) self parameter. */

typedef struct Sub02061fa4 {
    char _pad_c[0xc];
    void *fc;    /* +0xc */
    void *f10;   /* +0x10 */
} Sub02061fa4;

typedef struct Obj02061fa4 {
    char _pad_08[0x8];
    Sub02061fa4 *f8;    /* +0x8 */
    int field_c;          /* +0xc */
} Obj02061fa4;

extern void func_020544c8(void *a, void *selfAddr);
extern void func_0205407c(void *a, void *selfAddr);

void func_02061fa4(Obj02061fa4 *self) {
    if (self->field_c == 7) return;

    self->field_c = 7;
    func_020544c8(self->f8->fc, &self);
    func_0205407c(self->f8->f10, &self);
}
