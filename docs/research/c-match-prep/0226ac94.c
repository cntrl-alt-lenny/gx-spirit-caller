/* CAMPAIGN-PREP candidate for func_0226ac94 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store-order flag stores + reload-global guards + bic (&= ~) bit-clear
 *   risk:       Three distinct globals; bind-vs-reload of d016c base across 6 refs may differ (orig holds it in r1); store/guard ordering; d8c double-write.
 *   confidence: med
 */
/* func_ov002_0226ac94: set d016c flags (d90=1, d9c=0, d8c=0); if
 * d016c->f_d94 != (data_cd73c->f4 ^ 1) bail; if d016c->f_d0c == 0 bail;
 * else clear bit 0x200 in cd968->f_300 and set d016c->f_d8c = 2. */

extern char data_ov002_022d016c[];
extern char data_ov002_022cd73c[];
extern char data_ov002_022cd968[];

void func_ov002_0226ac94(void) {
    *(int *)(data_ov002_022d016c + 0xd90) = 1;
    *(int *)(data_ov002_022d016c + 0xd9c) = 0;
    *(int *)(data_ov002_022d016c + 0xd8c) = 0;
    if (*(int *)(data_ov002_022d016c + 0xd94) !=
        (*(int *)(data_ov002_022cd73c + 0x4) ^ 1))
        return;
    if (*(int *)(data_ov002_022d016c + 0xd0c) == 0)
        return;
    *(int *)(data_ov002_022cd968 + 0x300) &= ~0x200;
    *(int *)(data_ov002_022d016c + 0xd8c) = 2;
}
