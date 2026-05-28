/* func_ov002_021e27c0: C-39e variant — bne-skip-helper1 + cross-call compare.
 *
 * Orig shape (84 B, 22 ARM insns):
 *
 *     push  {r3, r4, r5, lr}
 *     movs  r4, r1                   ; r4 = arg1, set flags
 *     mov   r5, r0                   ; r5 = self_thing
 *     bne   .L_skip_helper1          ; if arg1 != 0, skip helper1 call
 *     bl    func_ov002_021c3cf0      ; helper1() — only when arg1 == 0
 *     mov   r4, r0                   ; r4 = helper1 result
 *   .L_skip_helper1:
 *     mov   r0, r5                   ; arg = self_thing
 *     bl    func_ov002_021c3cc8      ; helper2(self_thing)
 *     cmp   r4, r0                   ; compare r4 (arg1 or helper1 ret) with r0
 *     popeq {r3, r4, r5, pc}         ; if equal: return helper2's value
 *     cmp   r5, #0
 *     movne r0, #0x8000
 *     moveq r0, #0                   ; r0 = (self_thing ? 0x8000 : 0)
 *     orr   r0, r0, #0x52            ; tag = ... | 0x52
 *     lsl   r0, r0, #16
 *     lsl   r1, r4, #16
 *     mov   r2, #0
 *     mov   r3, r2
 *     lsr   r0, r0, #16              ; (u16) tag
 *     lsr   r1, r1, #16              ; (u16) n
 *     bl    func_ov002_021d479c      ; helper3(tag, n, 0, 0)
 *     pop   {r3, r4, r5, pc}
 *
 * Brief 239 deferred C-39e variant — instead of the C-39e canonical
 * "early-null-return" path, the orig uses `bne` to SKIP a helper1
 * call when arg1 != 0. The logic is:
 *
 *   n = (arg1 == 0) ? helper1() : arg1;
 *   m = helper2(self_thing);
 *   if (n == m) return m;
 *   tag = (self_thing ? 0x8000 : 0) | 0x52;
 *   return helper3(tag, n, 0, 0);
 *
 * Natural source recipe (if-else form, NOT early-return) — mwcc
 * preserves the orig's bne-branch + merged-tail structure.
 *
 * See `docs/research/recipe-gotchas.md` for the if-else vs
 * early-return distinction (gotcha 5).
 */

extern int func_ov002_021c3cf0(void);
extern int func_ov002_021c3cc8(int self_thing);
extern int func_ov002_021d479c(unsigned short tag, unsigned short packed,
                                int z0, int z1);

int func_ov002_021e27c0(int self_thing, int arg1) {
    int n;
    if (arg1 == 0) {
        n = func_ov002_021c3cf0();
    } else {
        n = arg1;
    }
    {
        int m = func_ov002_021c3cc8(self_thing);
        if (n == m) return m;
        {
            unsigned short tag = (unsigned short)(((self_thing ? 0x8000 : 0)) | 0x52);
            return func_ov002_021d479c(tag, (unsigned short)n, 0, 0);
        }
    }
}
