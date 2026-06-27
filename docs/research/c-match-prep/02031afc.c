/* CAMPAIGN-PREP candidate for func_02031afc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: store-order unlink; ldmia-fused 1st read, reload before 2nd link store
 *   risk:       orig FUSES first prev+next into `ldmia r0,{r2,r3}` then RELOADS both (ldr [r0],ldr [r0,#4]) before next->prev store; mwcc may reuse the loaded regs instead of reloading -> ldr count diverges. permuter-class (reg-alloc, shipped-as-.s).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02031afc (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Doubly-linked-list unlink, store-order
 * + reload sensitive (why it shipped as .s).
 *   head = *(Node**)data_0219adb8 (head holder at offset 0)
 *   if (head == node) head = node->next;        ; cmp;ldreq;streq
 *   {prev,next} = {node->prev, node->next};      ; ldmia r0,{r2,r3}
 *   prev->next = next;                           ; str r3,[r2,#4]
 *   RELOAD prev (ldr r3,[r0]) + next (ldr r2,[r0,#4]) ; then
 *   next->prev = prev;                           ; str r3,[r2]
 *   node->next = 0; node->prev = 0;              ; in THAT order
 *   recipe:     CLASS D store-order: emit field stores in asm order; let the
 *   first prev+next read fuse (ldmia) and reload before the 2nd link store.
 *   risk below names the reg-alloc divergence.
 */
struct N_02031afc {
    struct N_02031afc *prev; /* +0x0 */
    struct N_02031afc *next; /* +0x4 */
};
extern char data_0219adb8[];

void func_02031afc(struct N_02031afc *node) {
    struct N_02031afc **head = (struct N_02031afc **)data_0219adb8;
    if (*head == node) {
        *head = node->next;
    }
    node->prev->next = node->next;
    node->next->prev = node->prev;
    node->next = 0;
    node->prev = 0;
}
