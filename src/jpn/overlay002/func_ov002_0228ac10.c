/* func_ov002_0228ac10: C-39 — null-check arg1, bail if arg1->bit0 ==
 * self->bit0, else return helper(arg1) != 0. */
typedef unsigned short u16;
struct S0228ad20 { u16 f0; u16 bit0:1; u16 rest:15; };
extern int func_ov002_021b4b04(struct S0228ad20 *p);
int func_ov002_0228ac10(struct S0228ad20 *self, struct S0228ad20 *arg1) {
    if (arg1 == 0) return 0;
    if (arg1->bit0 == self->bit0) return 0;
    return func_ov002_021b4b04(arg1) != 0;
}
