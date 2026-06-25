/* CAMPAIGN-PREP candidate for func_0209c31c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BIND base; STORE-ORDER fields; reuse base+off (no spill); .legacy.c
 *   risk:       struct offsets guessed; func_020919d8 r0=&field_44 assumed leftover—if it's void the bytes still match; orr/bic encoding stable
 *   confidence: med
 */
/* file: src/main/func_0209c31c.legacy.c  (mwcc 1.2/sp2p3)
 * `sub sp,#4` + 2-step `ldmia {r4,r5,lr}; bx lr` => Style A => .legacy.c.
 * Setup: cache arg in callee-saved r5; bind the global struct base to
 * r4. Compute p=&base->field_44 (used as func_0209181c arg0, stored to
 * field_104, and left in r0 for the final func_020919d8 call). The orig
 * recomputes `add r4,#0x44` rather than spilling, so do NOT bind p to a
 * callee-saved local — reuse base+0x44 directly. Field stores in asm
 * order: field_104, field_40, then field_114 |= 8. */

typedef struct {
    char _pad_00[0x40];
    int  field_40;   /* +0x40 */
    char _pad_44[0x104 - 0x44];
    void *field_104; /* +0x104 */
    int  field_108;  /* +0x108 */
    char _pad_10c[0x114 - 0x10c];
    int  field_114;  /* +0x114 */
} data_021a84c0_t;
extern data_021a84c0_t data_021a84c0;
extern void func_0209181c(void *p, int arg);
extern void func_020919d8(void *p);

void func_0209c31c(int arg) {
    void *p = (char *)&data_021a84c0 + 0x44;
    func_0209181c(p, data_021a84c0.field_108);
    data_021a84c0.field_104 = (char *)&data_021a84c0 + 0x44;
    data_021a84c0.field_40 = arg;
    data_021a84c0.field_114 |= 0x8;
    func_020919d8((char *)&data_021a84c0 + 0x44);
}
