/* CAMPAIGN-PREP candidate for func_02098c70 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     small struct copy via stack temp + literal-pool word (A)
 *   risk:       reg-alloc-walled (ships as .s): the redundant stack scratch (str to [sp] then to [r0]) won't emit from plain C copy
 *   confidence: low
 */
/* func_02098c70: copy a 2-word header into *dst -- word0 = &data_021a8334 (a
 * vtable/fn-table pointer), word1 = src->f_18. The original also writes both
 * words to an 8-byte stack scratch first (dead copy). dst->f0 = &data_021a8334;
 * dst->f4 = src->f_18. (Currently hand .s; the dead [sp] scratch is the wall.) */

extern int data_021a8334[];

typedef struct {
    void *f_0;   /* +0x00: table pointer */
    int   f_4;   /* +0x04 */
} Hdr_02098c70;

typedef struct {
    char _pad0[0x18];
    int  f_18;   /* +0x18 */
} Src_02098c70;

void func_02098c70(Hdr_02098c70 *dst, Src_02098c70 *src) {
    dst->f_0 = data_021a8334;
    dst->f_4 = src->f_18;
}
