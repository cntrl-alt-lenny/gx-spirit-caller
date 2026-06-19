/* func_ov002_021f4be4: C-39a — sign-check via dead-arg helper-reuse.
 *
 * Orig shape (68 B, 17 ARM insns, no internal pool):
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     ldrh  r1, [r4, #2]              ; f2 raw halfword
 *     ldrh  r0, [r4, #4]              ; f4 raw halfword
 *     lsl   r2, r1, #31               ; bit 0 of f2 to top
 *     lsl   r1, r0, #17               ; bits 0-14 of f4 to top
 *     lsr   r0, r2, #31               ; r0 = bit0
 *     lsr   r1, r1, #23               ; r1 = field9
 *     bl    func_ov002_021b99c8       ; helper1(bit0, field9)
 *     movs  r1, r0                    ; r1 = n, set flags
 *     bmi   .end                       ; branch if N (n < 0)
 *     ldrh  r0, [r4, #2]
 *     lsl   r0, r0, #31
 *     lsr   r0, r0, #31                ; r0 = bit0
 *     bl    func_ov002_021d792c       ; helper2(bit0, n)
 *   .end:
 *     mov   r0, #1
 *     pop   {r4, pc}
 *
 * Brief 226 C-39a recipe (sign-check / dead-arg helper-reuse):
 * the orig's `movs r1, r0; bmi .end` is mwcc's peepholed form of
 * `mov r1, r0; cmp r1, #0; blt .end`. The peephole only fires when
 * n is live in r1 across the branch. Forcing that requires
 * declaring helper2 to take n as a second arg (even if effectively
 * unused by helper2); mwcc then allocates n to r1.
 *
 * Without the dead-arg trick (plain `helper2(bit0)`), mwcc folds
 * n into r0 and emits `cmp r0, #0; blt .end` — semantically
 * equivalent but byte-different.
 *
 * See `docs/research/brief-226-c39-subclass-sign-check-helper-reuse.md`.
 */

struct Func021f4cd4F2 {
    unsigned short bit0  : 1;
    unsigned short pad6  : 5;
    unsigned short tag6  : 6;
    unsigned short rest  : 4;
};

struct Func021f4cd4F4 {
    unsigned short pad6   : 6;
    unsigned short field9 : 9;
    unsigned short top    : 1;
};

struct Func021f4cd4Self {
    unsigned short pad0;
    struct Func021f4cd4F2 f2;
    struct Func021f4cd4F4 f4;
};

extern int func_ov002_021b99c8(unsigned int bit, unsigned int field9);
extern void func_ov002_021d792c(unsigned int bit, int n);

int func_ov002_021f4be4(struct Func021f4cd4Self *self) {
    int n = func_ov002_021b99c8(self->f2.bit0, self->f4.field9);
    if (n >= 0) {
        func_ov002_021d792c(self->f2.bit0, n);
    }
    return 1;
}
