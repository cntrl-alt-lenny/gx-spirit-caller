/* func_ov002_021b077c: while func_ov002_0229cc44() reports not-done, pull a
 * record from func_ov002_0229cc34() and forward its 4 u16 fields into the
 * queue sink func_ov002_021d4744, then service via func_ov002_0229cc3c.
 * Loop guarded by the incoming flag `a`. */
struct Rec4x16 { unsigned short f0, f1, f2, f3; };
extern int func_ov002_0229cc44(void);
extern struct Rec4x16 *func_ov002_0229cc34(void);
extern void func_ov002_021d4744(int a, int b, int c, int d);
extern void func_ov002_0229cc3c(void);

void func_ov002_021b077c(int a) {
    struct Rec4x16 *r;
    if (func_ov002_0229cc44()) return;
    do {
        r = func_ov002_0229cc34();
        func_ov002_021d4744(r->f0, r->f1, r->f2, r->f3);
        func_ov002_0229cc3c();
        if (a == 0) return;
    } while (func_ov002_0229cc44() == 0);
}
