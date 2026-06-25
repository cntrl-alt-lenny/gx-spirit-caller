/* CAMPAIGN-PREP candidate for func_0209d438 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD early-returns; bic (&=~const); tail call; .legacy.c
 *   risk:       struct offsets guessed; guard-merge predicated returns depend on sp2p3 2-step epilogue; unused param b must not be eliminated
 *   confidence: med
 */
/* file: src/main/func_0209d438.legacy.c  (mwcc 1.2/sp2p3)
 * `sub sp,#4` + 2-step `ldmfd {lr}; bx lr` (incl. ldmnefd/ldmeqfd guard
 * returns) => Style A => .legacy.c. Two guards then a bic-field + tail
 * call. arg1 (b, r1) is unused but kept for the ABI. `&= ~0x20` emits
 * `bic`. Tail: func_020919d8(base->field_104). */

typedef struct {
    char _pad_00[0x104];
    void *field_104; /* +0x104 */
    char _pad_108[0x114 - 0x108];
    int  field_114;  /* +0x114 */
} data_021a84c0_t;
extern data_021a84c0_t data_021a84c0;
extern void func_020919d8(void *p);

void func_0209d438(int a, int b, int c) {
    if (a != 0xb) return;
    if (c == 0) return;
    data_021a84c0.field_114 &= ~0x20;
    func_020919d8(data_021a84c0.field_104);
}
