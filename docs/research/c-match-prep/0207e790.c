/* CAMPAIGN-PREP candidate for func_0207e790 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT relocate + counted loop, BIND-NONE (reload count+base), u16 i, p-first add
 *   risk:       mwcc could hoist count/base out of the loop (binding) or pick a different i truncation
 *   confidence: med
 */
/* func_0207e790: relocate a self-relative pointer table in place.
 *
 *   ldr  r1, [r0, #0x4]    ; off = p->ptrs (relative)
 *   mov  ip, #0x0          ; i = 0
 *   add  r1, r1, r0        ; p->ptrs = (off + p)
 *   str  r1, [r0, #0x4]
 *   ldrh r1, [r0]          ; n = p->count
 *   cmp  r1, #0x0
 *   bxls lr                ; n==0 -> return
 * .L:
 *   ldr  r3, [r0, #0x4]            ; base reloaded each iter
 *   ldr  r2, [r3, ip, lsl #0x2]    ; v = base[i]
 *   add  r2, r0, r2                ; p + v   (p first)
 *   str  r2, [r3, ip, lsl #0x2]    ; base[i] = that
 *   ldrh r2, [r0]                  ; count reloaded each iter
 *   ... i = (u16)(i+1); cmp i,count; bcc .L
 *
 * count and base are RELOADED every iteration (no binding); i is u16.
 */

typedef struct {
    unsigned short count;  /* +0x0 */
    int           *ptrs;   /* +0x4 stored relative, relocated to abs */
} Reloc0207e790;

void func_0207e790(Reloc0207e790 *p) {
    unsigned short i;
    p->ptrs = (int *)((int)p->ptrs + (int)p);
    for (i = 0; i < p->count; i++) {
        p->ptrs[i] = (int)p + p->ptrs[i];
    }
}
