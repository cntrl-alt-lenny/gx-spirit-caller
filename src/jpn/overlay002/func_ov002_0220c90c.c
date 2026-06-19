/* func_ov002_0220c90c: C-39 — r = helper1(bit0, &func_0202ea74); if r
 * and pre(self) >= r, return 2; else 0. Pool word is a function ptr. */
typedef unsigned short u16;
struct S0220c9fc { u16 f0; u16 bit0:1; u16 rest:15; };
extern void func_0202ea74(void);
extern int func_ov002_021bbf20(int bit, void *fn);
extern int func_ov002_022576f4(struct S0220c9fc *self);
int func_ov002_0220c90c(struct S0220c9fc *self) {
    int r = func_ov002_021bbf20(self->bit0, (void *)func_0202ea74);
    if (r != 0) {
        if (func_ov002_022576f4(self) >= r) return 2;
    }
    return 0;
}
