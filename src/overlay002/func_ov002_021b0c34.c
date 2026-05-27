/* func_ov002_021b0c34: C-42 — multi-call thunk with conditional helper2 +
 * literal args.
 *
 * Orig shape (32 B, 8 ARM insns):
 *
 *     push  {r3, lr}
 *     bl    func_ov002_0226e46c       ; r0 = helper1()
 *     cmp   r0, #0
 *     popeq {r3, pc}                  ; if helper1==0, return 0 (r0 still 0)
 *     mov   r0, #26
 *     mov   r1, #1
 *     bl    func_ov002_021b0c04       ; helper2(26, 1)
 *     pop   {r3, pc}
 *
 * Brief 237 C-42 (multi-call thunk shapes): identified as the dominant
 * unclassified hard-tier cluster (861 picks out of 1725 unclassified =
 * 50%). NOT a wall — ships under natural source code with no special
 * idiom. The picks were "unclassified" because no detector recognised
 * the shape; brief 237 added a C-42 detector hint to flag the family
 * for mechanical drain.
 *
 * Key detail for THIS pick: orig uses `popeq {r3, pc}` without first
 * setting r0 to 0 — because r0 IS already 0 from the helper1 return.
 * The natural source `int r = helper1(); if (r == 0) return r;` makes
 * mwcc treat r as the return value, avoiding the extra `moveq r0, #0`
 * that `return 0;` would emit.
 *
 * See `docs/research/brief-237-hard-tier-landscape-survey.md`.
 */

extern int func_ov002_0226e46c(void);
extern int func_ov002_021b0c04(int arg0, int arg1);

int func_ov002_021b0c34(void) {
    int r = func_ov002_0226e46c();
    if (r == 0) return r;
    return func_ov002_021b0c04(26, 1);
}
