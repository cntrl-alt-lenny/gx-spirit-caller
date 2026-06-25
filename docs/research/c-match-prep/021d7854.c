/* CAMPAIGN-PREP candidate for func_021d7854 (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     triple counted-loop scan, early-return on hit
 *   risk:       KNOWN WALL (header brief 320 loop strength-reduction): mwcc keeps a separate i*2 counter vs orig inline add base,i,lsl#1
 *   confidence: low
 */
/* func_ov004_021d7854: three back-to-back u16 scans over data_02105a68 (counts at
 * [0],[8],[4]; halfword tables at +0xc, +0xca, +0xac). Each entry is fed to
 * 0202b9b0; if any returns 0 return 1, else return 0. */
extern char data_02105a68[];
extern int func_0202b9b0(unsigned short h);

int func_ov004_021d7854(void) {
    char *b = data_02105a68;
    unsigned int i;
    for (i = 0; i < *(unsigned int *)b; i++)
        if (func_0202b9b0(*(unsigned short *)(b + i * 2 + 0xc)) == 0) return 1;
    for (i = 0; i < *(unsigned int *)(b + 0x8); i++)
        if (func_0202b9b0(*(unsigned short *)(b + i * 2 + 0xca)) == 0) return 1;
    for (i = 0; i < *(unsigned int *)(b + 0x4); i++)
        if (func_0202b9b0(*(unsigned short *)(b + i * 2 + 0xac)) == 0) return 1;
    return 0;
}
