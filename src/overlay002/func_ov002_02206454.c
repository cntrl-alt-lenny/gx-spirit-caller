/* func_ov002_02206454: C-39b — helper-reuse via callee-saved + cross-call compare.
 *
 * Orig shape (60 B, 15 ARM insns):
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0                    ; r5 = self (held across helpers)
 *     ldrh  r0, [r5, #2]              ; f2 halfword
 *     lsl   r1, r0, #26               ; bits 0-5 to top
 *     lsl   r2, r0, #31               ; bit 0 to top
 *     lsr   r0, r2, #31               ; r0 = bit0
 *     lsr   r1, r1, #27               ; r1 = field5 (bits 1-5)
 *     bl    func_ov002_021b9e00       ; helper1(bit0, field5)
 *     mov   r4, r0                    ; r4 = n (callee-saved, survives helper2)
 *     mov   r0, r5                    ; helper2(self)
 *     bl    func_ov002_021f4194
 *     cmp   r4, r0                    ; compare n with helper2's return
 *     movge r0, #1
 *     movlt r0, #0
 *     pop   {r3, r4, r5, pc}
 *
 * Brief 226 C-39b variant — n is preserved ACROSS a second call and
 * compared with its return. Because helper2 is called between n's
 * definition and use, mwcc must save n in a callee-saved register
 * (r4); self is also saved in r5 for the same reason. The trailing
 * `return n >= helper2(self)` lowers to `cmp r4, r0; movge #1; movlt
 * #0` — mwcc's standard idiom for "return bool from comparison."
 *
 * Recipe: `int n = helper1(args); return n >= helper2(self);`.
 *
 * See `docs/research/brief-226-c39-subclass-sign-check-helper-reuse.md`.
 */

struct Func02206454F2 {
    unsigned short bit0   : 1;
    unsigned short field5 : 5;
    unsigned short rest   : 10;
};

struct Func02206454Self {
    unsigned short pad0;
    struct Func02206454F2 f2;
};

extern int func_ov002_021b9e00(unsigned int bit, unsigned int field5);
extern int func_ov002_021f4194(struct Func02206454Self *self);

int func_ov002_02206454(struct Func02206454Self *self) {
    int n = func_ov002_021b9e00(self->f2.bit0, self->f2.field5);
    return n >= func_ov002_021f4194(self);
}
