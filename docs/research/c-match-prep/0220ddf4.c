/* CAMPAIGN-PREP candidate for func_0220ddf4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ce288 global guard + no-arg bool tail (!=0)
 *   risk:       f484 read as int via char[]+off cast; if real symbol is typed struct the pool/offset is identical so low risk
 *   confidence: high
 */
/* func_ov002_0220ddf4: guard on ce288.f484, then bool-tail of a no-arg query.
 *
 *   ldr r2,=ce288; ldr r2,[r2,#0x484]; add r2,#1; cmp r2,#3
 *   movlt r0,#0; popLT                 ; if (val+1 < 3) return 0
 *   bl func_0220dd34
 *   cmp r0,#0; movne r0,#1; moveq r0,#0; pop   ; return q() != 0
 */
extern char data_ov002_022ce288[];
extern int func_ov002_0220dd34(void);

int func_ov002_0220ddf4(void) {
    if (*(int *)(data_ov002_022ce288 + 0x484) + 1 < 3) return 0;
    return func_ov002_0220dd34() != 0;
}
