/* func_0206200c: dispatcher. flag==0 sets state 6 and calls the
 * "cancel" path; otherwise, once state reaches 7+, run the teardown
 * sequence. */

typedef struct {
    char _pad_c[0xc];
    int field_c;   /* +0xc */
} Obj0206200c;

extern void func_02061fa4(Obj0206200c *self);
extern void func_020628fc(Obj0206200c *self);
extern void func_02061a8c(Obj0206200c *self, int x);
extern void func_02064790(Obj0206200c *self);
extern void func_02062b48(Obj0206200c *self);

void func_0206200c(Obj0206200c *self, int flag) {
    if (flag == 0) goto L_b0c;

    if (self->field_c >= 7) return;

    func_02061fa4(self);
    func_020628fc(self);
    func_02061a8c(self, 0);
    func_02064790(self);
    return;

L_b0c:
    self->field_c = 6;
    func_02062b48(self);
}
