/* CAMPAIGN-PREP candidate for func_021ae7b8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     short-circuit || for ldrne/cmpne guard; preserve store order of tail writes
 *   risk:       reshape-able: orig fully PREDICATES the guard (ldreq/moveq/streq, no branch); if mwcc emits a `beq` over the block, the `||` is right logically but diverges structurally — accept or escape. Pool symbol order also a minor reloc risk.
 *   confidence: med
 */
/* func_ov002_021ae7b8: nine fixed (ptr,size) init calls to func_ov002_0229cd5c,
 * then a 2-way guard that arms data_ov002_022d016c.f3340, and three tail stores. */

extern char data_ov002_022cd300[];
extern char data_ov002_022cd31c[];
extern char data_ov002_022cd3f4[];
extern char data_ov002_022cd524[];
extern char data_ov002_022cd73c[];
extern char data_ov002_022cd968[];
extern char data_ov002_022cdc78[];
extern char data_ov002_022ce288[];
extern char data_ov002_022ce950[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern int  func_ov002_0229cd5c(void *p, int size);

void func_ov002_021ae7b8(void) {
    func_ov002_0229cd5c(data_ov002_022cf16c, 0x1dc0);
    func_ov002_0229cd5c(data_ov002_022cdc78, 0x610);
    func_ov002_0229cd5c(data_ov002_022ce950, 0x81c);
    func_ov002_0229cd5c(data_ov002_022cd300, 0x1c);
    func_ov002_0229cd5c(data_ov002_022ce288, 0x6c8);
    func_ov002_0229cd5c(data_ov002_022cd3f4, 0x130);
    func_ov002_0229cd5c(data_ov002_022cd31c, 0xd8);
    func_ov002_0229cd5c(data_ov002_022cd524, 0x218);
    func_ov002_0229cd5c(data_ov002_022cd968, 0x310);
    if (*(int *)(data_ov002_022cd73c + 0x8) == 2 ||
        *(int *)(data_ov002_022cd73c + 0xc) == 2) {
        *(int *)(data_ov002_022d016c + 0xd0c) = 1;
    }
    *(int *)(data_ov002_022d016c + 0xcf8) = 7;
    *(int *)(data_ov002_022cd73c + 0x224) = 0;
    *(int *)(data_ov002_022cd73c + 0x228) = 0;
}
