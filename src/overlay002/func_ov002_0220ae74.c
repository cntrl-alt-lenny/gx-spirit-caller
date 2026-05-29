/* func_ov002_0220ae74: C-39 — guard on func_021c3ae4(bit0, f0); else
 * tail func_021ff3bc(self, arg). */
typedef unsigned short u16;
struct S0220ae74 { u16 f0; u16 bit0:1; u16 rest:15; };
extern int func_ov002_021c3ae4(int bit0, u16 f0);
extern int func_ov002_021ff3bc(struct S0220ae74 *self, int arg);
int func_ov002_0220ae74(struct S0220ae74 *self, int arg) {
    if (func_ov002_021c3ae4(self->bit0, self->f0) == 0) return 0;
    return func_ov002_021ff3bc(self, arg);
}
