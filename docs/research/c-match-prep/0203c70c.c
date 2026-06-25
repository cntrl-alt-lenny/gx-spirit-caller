/* CAMPAIGN-PREP candidate for func_0203c70c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Tiny flag-test bx lr; if-guard returning 0/1 (not ternary)
 *   risk:       Field offset 0xb0 guessed; the (null||bit-set)->1 vs bit-clear->0 branch shape
 *   confidence: high
 */
/* func_0203c70c: leaf flag test.
 *  cmp r0,#0; beq ->1
 *  ldrh r0,[r0,#0xb0]; tst r0,#0x800; beq ->0
 *  else ->1
 * i.e. if(p && !(p->flags & 0x800)) return 0; return 1;
 */
typedef struct {
    char           _pad00[0xb0];
    unsigned short flags;   /* +0xb0 (ldrh) */
} Obj;

int func_0203c70c(Obj *p) {
    if (p != 0 && !(p->flags & 0x800)) return 0;
    return 1;
}
