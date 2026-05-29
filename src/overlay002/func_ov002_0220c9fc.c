/* func_ov002_0220c9fc: C-39 — r = helper1(bit0, &func_0202eac8); if r
 * and pre(self) >= r, return 2; else 0. Pool word is a function ptr. */
typedef unsigned short u16;
struct S0220c9fc { u16 f0; u16 bit0:1; u16 rest:15; };
extern void func_0202eac8(void);
extern int func_ov002_021bc000(int bit, void *fn);
extern int func_ov002_022577dc(struct S0220c9fc *self);
int func_ov002_0220c9fc(struct S0220c9fc *self) {
    int r = func_ov002_021bc000(self->bit0, (void *)func_0202eac8);
    if (r != 0) {
        if (func_ov002_022577dc(self) >= r) return 2;
    }
    return 0;
}
