/* func_ov002_02292090: C-39 — if pre(self) is set and
 * helper(1-bit0, 0xa) > 0, return 1; else 0 (inverted polarity). */
typedef unsigned short u16;
struct S022921a0 { u16 f0; u16 bit0:1; u16 rest:15; };
extern int func_ov002_02291050(struct S022921a0 *self);
extern int func_ov002_021bbb78(int x, int k);
int func_ov002_02292090(struct S022921a0 *self) {
    if (func_ov002_02291050(self) != 0) {
        if (func_ov002_021bbb78(1 - self->bit0, 0xa) > 0) return 1;
    }
    return 0;
}
