/* CAMPAIGN-PREP candidate for func_02017a98 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GetSystemWork bitfield-guard + linear guard-chain, conditional tail store
 *   risk:       0x8d8&1 guard → `and #1` wall; `ldrcs r0,_LIT; strcs` conditional load may emit full materialize; r4/r5 order
 *   confidence: low
 */
/* func_02017a98: GetSystemWork-singleton guard-chain. r0 = task ptr (-> r4),
 * work singleton -> r5. Requires state[0x920]==1, func_020190ec()!=0,
 * func_020139c4()==5, then if func_02019034() >= w[0x8dc]+1 stores 0x00240100
 * to o[8]. Shipped as .s (brief 302); 0x8d8 bit0 guard is the mwcc `and #1`
 * wall. Local order (o before w) mirrors the mov r4,r0 / mov r5,r0 sequence. */
extern char *GetSystemWork(void);
extern int  func_020139c4(void);
extern int  func_02019034(void);
extern int  func_020190ec(void);

void func_02017a98(void *o) {
    char *w = GetSystemWork();
    if (!((*(unsigned int *)(w + 0x8d8) << 0x1f) >> 0x1f))
        return;
    if (*(int *)(w + 0x920) != 1) return;
    if (func_020190ec() == 0) return;
    if (func_020139c4() != 5) return;
    if ((unsigned int)func_02019034() >= (unsigned int)(*(int *)(w + 0x8dc) + 1))
        *(int *)((char *)o + 8) = 0x00240100;
}
