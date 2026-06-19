/* func_ov002_02200560: C-39d — multi-call re-read with rsb-bit-invert + ternary.
 *
 * Orig shape (76 B, 19 ARM insns):
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     ldrh  r1, [r4, #2]
 *     lsl   r1, r1, #31
 *     lsr   r1, r1, #31                   ; r1 = bit0
 *     bl    func_ov002_022579d0           ; helper(self, bit0)
 *     cmp   r0, #2
 *     movlt r0, #0
 *     poplt {r4, pc}                      ; early-return 0 if n < 2
 *     ldrh  r1, [r4, #2]                 ; RE-READ
 *     mov   r0, r4                        ; self for 2nd call
 *     lsl   r1, r1, #31
 *     lsr   r1, r1, #31                   ; bit0
 *     rsb   r1, r1, #1                    ; !bit0
 *     bl    func_ov002_022579d0           ; helper(self, !bit0)
 *     cmp   r0, #1
 *     movlt r0, #0                        ; (orig emits movlt BEFORE movge!)
 *     movge r0, #2
 *     pop   {r4, pc}
 *
 * Brief 229 C-39d — natural-source recipe with the SAME helper called
 * twice (different args). The re-read is emitted naturally.
 *
 * Tail ternary detail: orig has `movlt #0; movge #2` (lt-then-ge);
 * mwcc emits the conditional-move ORDER based on the source's
 * if-true/if-false branch order. `m < 1 ? 0 : 2` (lt-true-first) emits
 * `movlt #0; movge #2`; the equivalent `m >= 1 ? 2 : 0` (ge-true-first)
 * emits `movge #2; movlt #0` — semantically identical but byte-different.
 * Brief 227's wave 2 cheat sheet shows the same condition-mapping
 * principle.
 *
 * See `func_ov002_02204e38.c` for the recipe rationale.
 */

struct Func02200650F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct Func02200650Self {
    unsigned short pad0;
    struct Func02200650F2 f2;
};

extern int func_ov002_022579d0(struct Func02200650Self *self, unsigned int bit);

int func_ov002_02200560(struct Func02200650Self *self) {
    int n = func_ov002_022579d0(self, self->f2.bit0);
    if (n < 2) return 0;
    {
        int m = func_ov002_022579d0(self, 1 - self->f2.bit0);
        return m < 1 ? 0 : 2;
    }
}
