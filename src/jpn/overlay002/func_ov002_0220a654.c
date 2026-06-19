/* func_ov002_0220a654: C-39 — guard on func_021ca698(bit0, bit0); else
 * tail func_021ff500(self, arg). */
typedef unsigned short u16;
struct S0220a744 { u16 f0; u16 bit0:1; u16 rest:15; };
extern int func_ov002_021ca5b8(int a, int b);
extern int func_ov002_021ff410(struct S0220a744 *self, int arg);
int func_ov002_0220a654(struct S0220a744 *self, int arg) {
    if (func_ov002_021ca5b8(self->bit0, self->bit0) == 0) return 0;
    return func_ov002_021ff410(self, arg);
}
