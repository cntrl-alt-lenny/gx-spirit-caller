/* func_ov002_0220673c: C-39b idiom 2 (cross-call compare) + helper3 tail.
 *
 * Orig shape (68 B, 17 ARM insns):
 *
 *     push  {r4, r5, r6, lr}
 *     mov   r6, r0                    ; r6 = self (callee-saved)
 *     ldrh  r0, [r6, #2]
 *     mov   r5, r1                    ; r5 = arg1 (saved across all calls)
 *     lsl/lsr #31                      ; bit0
 *     bl    func_ov002_021c24f8       ; helper1(bit0)
 *     mov   r4, r0                    ; r4 = n (saved across helper2)
 *     mov   r0, r6                    ; helper2(self)
 *     bl    func_ov002_021f4194
 *     cmp   r4, r0                    ; cmp n with helper2_ret
 *     movlt r0, #0
 *     poplt {r4, r5, r6, pc}          ; if n < helper2_ret: return 0
 *     mov   r0, r6                    ; r0 = self
 *     mov   r1, r5                    ; r1 = arg1
 *     bl    func_ov002_021ff400       ; helper3(self, arg1)
 *     pop   {r4, r5, r6, pc}
 *
 * Brief 232 deferred this pick — natural recipe ships byte-identical.
 * Brief 230 noted a "dead-store artifact" concern but the standard
 * `int n = helper1(bit0); if (n < helper2(self)) return 0; return
 * helper3(self, arg1);` form produces the exact orig shape.
 *
 * This is C-39b idiom 2 (cross-call comparison) + a trailing
 * helper3 call — the trailing call extends sub-shape B with a 3rd
 * helper for sequential dispatch.
 *
 * See `docs/research/brief-235-c39e-c40-broader-and-232-deferred.md`.
 */

struct Func0220673cF2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct Func0220673cSelf {
    unsigned short pad0;
    struct Func0220673cF2 f2;
};

extern int func_ov002_021c24f8(unsigned int bit);
extern int func_ov002_021f4194(struct Func0220673cSelf *self);
extern int func_ov002_021ff400(struct Func0220673cSelf *self, int arg);

int func_ov002_0220673c(struct Func0220673cSelf *self, int arg1) {
    int n = func_ov002_021c24f8(self->f2.bit0);
    if (n < func_ov002_021f4194(self)) return 0;
    return func_ov002_021ff400(self, arg1);
}
