/* func_ov002_021f8490: C-39b — helper-reuse (sign-check, non-peepholed).
 *
 * Orig shape (56 B, 14 ARM insns):
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     bl    func_ov002_021f40f4       ; helper1(self)
 *     mov   r1, r0                    ; r1 = n (held live)
 *     cmp   r1, #0                    ; non-peepholed compare
 *     ble   .end                       ; branch if n <= 0
 *     ldrh  r0, [r4, #2]
 *     mov   r2, #0
 *     mov   r3, r2                    ; r3 = 0
 *     lsl   r0, r0, #31
 *     lsr   r0, r0, #31                ; r0 = bit0
 *     bl    func_ov002_0226aea8       ; helper2(bit0, n, 0, 0)
 *   .end:
 *     mov   r0, #1
 *     pop   {r4, pc}
 *
 * Brief 226 C-39b recipe (helper-reuse, sign-check via `> 0`): n is
 * passed as helper2's second argument AND is sign-checked. Because
 * `n > 0` requires testing both Z and N (whereas `n < 0` is pure N),
 * the `mov + cmp` doesn't peephole into `movs` — the orig keeps both
 * instructions distinct.
 *
 * This is the same shape brief 222/224's `func_ov002_021f4a00.c`
 * recipe locks: `int n = helper1(...); if (n > 0) helper2(arg, n, 0, 0);`
 * The named-local n + use-as-helper2-arg forces mwcc to allocate
 * n to r1 and emit the canonical mov-cmp-ble shape.
 *
 * See `docs/research/brief-226-c39-subclass-sign-check-helper-reuse.md`.
 */

struct Func021f8490F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct Func021f8490Self {
    unsigned short pad0;
    struct Func021f8490F2 f2;
};

extern int func_ov002_021f40f4(struct Func021f8490Self *self);
extern int func_ov002_0226aea8(unsigned int bit, int n, unsigned int z0, unsigned int z1);

int func_ov002_021f8490(struct Func021f8490Self *self) {
    int n = func_ov002_021f40f4(self);
    if (n > 0) {
        func_ov002_0226aea8(self->f2.bit0, n, 0, 0);
    }
    return 1;
}
