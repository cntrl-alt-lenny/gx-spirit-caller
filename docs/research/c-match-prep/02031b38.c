/* CAMPAIGN-PREP candidate for func_02031b38 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: split u64 call-result lo/hi; reload-head-between-stores (b74 idiom)
 *   risk:       depends on func_0203194c returning u64 (r0/r1) so the lo/hi split stays as two str; and on the owner->f30 RELOAD (not reuse) matching `ldr [r5,#0x30]` twice. arg order owner=r0/node=r1 is struct-guessed. reshape-able via reload phrasing.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02031b38 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. List insert; same head-push idiom as the
 * ALREADY-MATCHED sibling func_02031b74 (re-reads the head between stores).
 *   args: owner=r0, node=r1.
 *   id64 = func_0203194c(node);            ; returns u64 (r0=lo,r1=hi)
 *   node->f10 = (u32)id64; node->f14 = (u32)(id64>>32);
 *   head = owner->f30;                     ; ldr r1,[r5,#0x30]
 *   head->f4 = node;                       ; str r4,[r1,#4]
 *   node->f4 = &owner->f30;                ; str r0,[r4,#4]  (add r0,r5,#0x30)
 *   node->f0 = owner->f30 (RELOAD);        ; ldr r0,[r5,#0x30]; str r0,[r4]
 *   owner->f30 = node;                     ; str r4,[r5,#0x30]
 *   recipe:     CLASS D store-order: split 64-bit call result lo/hi; mirror
 *   the func_02031b74 reload-head-between-stores shape.
 */
extern unsigned long long func_0203194c(void *node);

void func_02031b38(int *owner, int *node) {
    unsigned long long id = func_0203194c(node);
    node[4] = (int)id;            /* +0x10 */
    node[5] = (int)(id >> 32);    /* +0x14 */
    {
        int *head = (int *)owner[12];      /* +0x30 */
        head[1] = (int)node;               /* head->f4 = node */
        node[1] = (int)&owner[12];         /* node->f4 = &owner->f30 */
        node[0] = owner[12];               /* reload owner->f30; node->f0 = head */
        owner[12] = (int)node;             /* owner->f30 = node */
    }
}
