/* func_ov002_02206608: C-39e variant — bit-equality test + helper-branch.
 *
 * Orig shape (96 B, 24 ARM insns):
 *
 *     push  {r4, lr}
 *     movs  r4, r1                   ; r4 = arg1, set flags
 *     moveq r0, #0
 *     popeq {r4, pc}                 ; if arg1 == NULL: return 0
 *     ldrh  r1, [r4, #2]
 *     ldrh  r0, [r0, #2]             ; r0 still = self
 *     lsl/lsr #31                     ; bit0 of arg1->f2 and self->f2
 *     cmp   r1, r0, lsr #31          ; cmp arg1.bit0 with self.bit0
 *     moveq r0, #0
 *     popeq {r4, pc}                 ; if bit0s equal: return 0
 *     ldrh  r0, [r4]
 *     bl    func_0202e234            ; helper(arg1->f0)
 *     cmp   r0, #0
 *     bne   .L_tail                  ; if helper != 0, take tail branch
 *     ldrh  r0, [r4, #2]
 *     lsl   r0, r0, #18
 *     lsrs  r0, r0, #30              ; bits 12-13 of arg1->f2 (2-bit field)
 *     movne r0, #0
 *     popne {r4, pc}                 ; if field2 != 0: return 0
 *   .L_tail:
 *     mov   r0, r4
 *     bl    func_ov002_021b4be4      ; helper2(arg1)
 *     pop   {r4, pc}
 *
 * Brief 239 deferred C-39e variant — C-39e prologue + bit-equality
 * check on a SECOND struct + helper-branch with merged tail call.
 *
 * Recipe gotcha: the natural `if (helper(...) != 0) return helper2(...)`
 * form emits a DUPLICATE bl helper2 (1 for the if-branch, 1 at function
 * end). To match orig's single bl + bne-merge form, use `&&`
 * short-circuit:
 *
 *   if (helper(...) == 0 && field2 != 0) return 0;
 *   return helper2(...);
 *
 * mwcc lowers `helper == 0 && X != 0` as: bl helper; cmp #0; bne .tail
 * (if helper != 0, skip the field check and fall through to helper2);
 * ldrh + lsl/lsrs; movne #0; popne (if field2 != 0); fallthrough.tail:
 * bl helper2. The single bl helper2 handles both "helper != 0" and
 * "helper == 0 && field2 == 0" paths.
 *
 * See `docs/research/recipe-gotchas.md` for the general "merge
 * duplicate-call paths via &&" pattern.
 */

struct Func02206608Self {
    unsigned short f0;
    struct {
        unsigned short bit0   : 1;
        unsigned short pad    : 11;
        unsigned short field2 : 2;
        unsigned short top    : 2;
    } f2;
};

extern int func_0202e234(unsigned int x);
extern int func_ov002_021b4be4(struct Func02206608Self *self);

int func_ov002_02206608(struct Func02206608Self *self,
                         struct Func02206608Self *arg1) {
    if (arg1 == 0) return 0;
    if (arg1->f2.bit0 == self->f2.bit0) return 0;
    if (func_0202e234(arg1->f0) == 0 && arg1->f2.field2 != 0) return 0;
    return func_ov002_021b4be4(arg1);
}
