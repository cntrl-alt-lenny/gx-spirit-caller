/* CAMPAIGN-PREP candidate for func_02017df0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GetSystemWork bitfield-guard + cmp/beq state chain (1,2), guard-chains + RMW
 *   risk:       0x8d8&1 guard → `and #1` wall; literal-pool message loads and call ordering may diverge
 *   confidence: low
 */
/* func_02017df0: GetSystemWork-singleton handler. r0 = task ptr (-> r5),
 * work -> r4. state[0x920] via cmp/beq (1,2). o[8] = message id.
 * w[0x900] bit24 set/clear. Shipped as .s (brief 302); 0x8d8 bit0 guard is
 * the mwcc `and #1` wall. */
extern char *GetSystemWork(void);
extern int  func_020139c4(void);
extern int  func_020190ec(void);
extern int  func_02019664(void);
extern void func_0201aabc(int);
extern void func_0201aaf4(int);
extern void func_0201b7b4(void);
extern int  func_0201b7e0(void *);

void func_02017df0(void *o) {
    char *w = GetSystemWork();
    if (!((*(unsigned int *)(w + 0x8d8) << 0x1f) >> 0x1f))
        return;
    if (*(int *)(w + 0x920) == 1) {
        if (func_020190ec() == 0) return;
        if (func_020139c4() != 5) return;
        *(int *)((char *)o + 8) = 0x00280100;
        func_0201aabc(0x7b);
        *(int *)(w + 0x900) |= 0x1000000;
        return;
    }
    if (*(int *)(w + 0x920) == 2) {
        if (func_0201b7e0(o) != 3) return;
        if (func_02019664() != 0x7b) return;
        *(int *)((char *)o + 8) = 0x00280200;
        func_0201aaf4(0x7b);
        func_0201b7b4();
        *(int *)(w + 0x900) &= ~0x1000000;
        return;
    }
}
