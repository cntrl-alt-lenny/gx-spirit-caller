/* func_ov002_0228b894: C-39e simplest variant — helper1 takes only `self`
 * (no bit-extract). 52 B, 13 ARM insns.
 *
 * Orig shape:
 *
 *     push  {r3, r4, r5, lr}
 *     movs  r4, r1                    ; arg1 in r4, set flags
 *     mov   r5, r0                    ; self in r5
 *     moveq r0, #0
 *     popeq {r3, r4, r5, pc}          ; if arg1 == 0: return 0
 *     bl    func_ov002_02291214       ; helper1(self) — self already in r0
 *     cmp   r0, #0
 *     moveq r0, #0
 *     popeq {r3, r4, r5, pc}
 *     mov   r0, r5
 *     mov   r1, r4
 *     bl    func_ov002_0228b5f4       ; helper2(self, arg1)
 *     pop   {r3, r4, r5, pc}
 *
 * Brief 235 C-39e simplest case. See `func_ov002_0228b810.c` for
 * the recipe rationale.
 */

struct Func0228b894Self {
    unsigned short pad0;
    unsigned short f2;
};

extern int func_ov002_02291214(struct Func0228b894Self *self);
extern int func_ov002_0228b5f4(struct Func0228b894Self *self, int arg);

int func_ov002_0228b894(struct Func0228b894Self *self, int arg1) {
    if (arg1 == 0) return 0;
    if (func_ov002_02291214(self) == 0) return 0;
    return func_ov002_0228b5f4(self, arg1);
}
