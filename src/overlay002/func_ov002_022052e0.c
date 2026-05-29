/* func_ov002_022052e0: C-39 — like 0228ad20 but return (helper(arg1) &
 * 2) > 0. */
typedef unsigned short u16;
struct S022052e0 { u16 f0; u16 bit0:1; u16 rest:15; };
extern int func_ov002_021b6600(struct S022052e0 *p);
int func_ov002_022052e0(struct S022052e0 *self, struct S022052e0 *arg1) {
    if (arg1 == 0) return 0;
    if (arg1->bit0 == self->bit0) return 0;
    return (func_ov002_021b6600(arg1) & 2) > 0;
}
