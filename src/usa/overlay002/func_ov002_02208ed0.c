/* func_ov002_02208ed0: C-39 — loop i in 0..4; if helper(1-bit0, i) is
 * non-zero return 1; else 0. */
typedef unsigned short u16;
struct S02208fc0 { u16 f0; u16 bit0:1; u16 rest:15; };
extern int func_ov002_021bc47c(int x, int i);
int func_ov002_02208ed0(struct S02208fc0 *self) {
    int i;
    for (i = 0; i <= 4; i++) {
        if (func_ov002_021bc47c(1 - self->bit0, i) != 0) return 1;
    }
    return 0;
}
