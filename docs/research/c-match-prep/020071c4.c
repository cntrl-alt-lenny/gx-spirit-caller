/* CAMPAIGN-PREP candidate for func_020071c4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield-test guard (lsl#1e;lsr#1f = bit1) + branch-tail clear; bind base after guard
 *   risk:       Orig uses TWO pool words for same addr (patcher trim bypass); clean C dedupes to one — likely 1-word diff.
 *   confidence: low
 */
/* func_020071c4: guard on bit 1 of field 0x10; if clear, return immediately.
 * Otherwise run func_02006918/func_02006a38, optionally func_020057dc when
 * field 0x14 != 0, then clear bit 1 of field 0x10 and zero field 0x14.
 *
 *   mov r0,r0,lsl #0x1e ; movs r0,r0,lsr #0x1f  -> extract bit 1
 *   ldmeqia sp!,{...}                            -> early return if 0
 *
 * The guard reads the field through a throwaway reference (caller-saved
 * scratch) so the callee-saved base is only materialized after the guard
 * passes. NOTE: orig emits two literal-pool words for data_02104f1c (one
 * via the .extern symbol for the guard, one via a raw 0x02104f1c literal
 * that bypasses the patcher trim) — a clean-C single global reference will
 * dedupe these into one pool word.
 */
typedef struct {
    char         _pad_00[0x10];
    unsigned int flags;        /* +0x10, bit1 = active */
    int          ctx;          /* +0x14 */
} mgr_t;

extern mgr_t data_02104f1c;
extern void  func_020057dc(void);
extern void  func_02006918(void);
extern void  func_02006a38(void);

void func_020071c4(void) {
    mgr_t *p;

    if (!(data_02104f1c.flags & 0x2)) return;

    func_02006918();
    func_02006a38();

    p = &data_02104f1c;
    if (p->ctx != 0) func_020057dc();
    p->flags &= ~0x2u;
    p->ctx = 0;
}
