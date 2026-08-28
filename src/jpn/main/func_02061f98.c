/* func_02061f98: dispatcher. flag==0 sets state 6 and calls the
 * "cancel" path; otherwise, once state reaches 7+, run the teardown
 * sequence. */

typedef struct {
    char _pad_c[0xc];
    int field_c;   /* +0xc */
} Obj0206200c;

extern void func_02061f30(Obj0206200c *self);
extern void func_02062888(Obj0206200c *self);
extern void func_02061a18(Obj0206200c *self, int x);
extern void func_0206471c(Obj0206200c *self);
extern void func_02062ad4(Obj0206200c *self);

void func_02061f98(Obj0206200c *self, int flag) {
    if (flag == 0) goto L_b0c;

    if (self->field_c >= 7) return;

    func_02061f30(self);
    func_02062888(self);
    func_02061a18(self, 0);
    func_0206471c(self);
    return;

L_b0c:
    self->field_c = 6;
    func_02062ad4(self);
}
