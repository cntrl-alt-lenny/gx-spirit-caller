/* func_ov002_021f83fc: C-39a — sign-check via dead-arg helper-reuse.
 *
 * Orig shape (68 B, 17 ARM insns) identical to func_ov002_021f4be4
 * apart from helper2 (021d7c40 here vs 021d7a1c there). This was
 * brief 224's canary: it reached 84% close under a naive recipe
 * but the post-helper sign-check diverged (`cmp r0, #0; blt` vs
 * orig's `movs r1, r0; bmi`). Brief 226 locked the dead-arg trick
 * — pass n as helper2's second arg so mwcc keeps n live in r1,
 * then `mov + cmp` peepholes into `movs`.
 *
 * See `func_ov002_021f4be4.c` for the recipe rationale and
 * `docs/research/brief-226-c39-subclass-sign-check-helper-reuse.md`
 * for the variant matrix.
 */

struct Func021f84ecF2 {
    unsigned short bit0  : 1;
    unsigned short pad6  : 5;
    unsigned short tag6  : 6;
    unsigned short rest  : 4;
};

struct Func021f84ecF4 {
    unsigned short pad6   : 6;
    unsigned short field9 : 9;
    unsigned short top    : 1;
};

struct Func021f84ecSelf {
    unsigned short pad0;
    struct Func021f84ecF2 f2;
    struct Func021f84ecF4 f4;
};

extern int func_ov002_021b99c8(unsigned int bit, unsigned int field9);
extern void func_ov002_021d7b50(unsigned int bit, int n);

int func_ov002_021f83fc(struct Func021f84ecSelf *self) {
    int n = func_ov002_021b99c8(self->f2.bit0, self->f4.field9);
    if (n >= 0) {
        func_ov002_021d7b50(self->f2.bit0, n);
    }
    return 1;
}
