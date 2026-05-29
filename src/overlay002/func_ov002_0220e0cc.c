/* func_ov002_0220e0cc: C-39 — guard on func_021ca63c(bit0, 1); else
 * tail func_021ff500(self, arg). */
typedef unsigned short u16;
struct S0220e0cc { u16 f0; u16 bit0:1; u16 rest:15; };
extern int func_ov002_021ca63c(int bit0, int k);
extern int func_ov002_021ff500(struct S0220e0cc *self, int arg);
int func_ov002_0220e0cc(struct S0220e0cc *self, int arg) {
    if (func_ov002_021ca63c(self->bit0, 1) == 0) return 0;
    return func_ov002_021ff500(self, arg);
}
