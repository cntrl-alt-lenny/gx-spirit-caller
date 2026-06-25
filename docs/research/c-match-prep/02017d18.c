/* CAMPAIGN-PREP candidate for func_02017d18 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GetSystemWork bitfield-guard + cmp/beq state chain (1,2,3), RMW + tail stores
 *   risk:       0x8d8&1 guard → `and #1` wall; cond loads `ldr r1,_LIT;str` and call ordering may diverge
 *   confidence: low
 */
/* func_02017d18: GetSystemWork-singleton handler. r0 = task ptr (-> r5),
 * work -> r4. state[0x920] via cmp/beq (1,2,3). o[8] = message id.
 * w[0x900] bit24 set/clear. Shipped as .s (brief 302); 0x8d8 bit0 guard is
 * the mwcc `and #1` wall. */
extern char *GetSystemWork(void);
extern void func_02018a38(int);
extern void func_02018a64(void);
extern int  func_02019664(void);
extern int  func_0201969c(void);
extern void func_0201abb0(int);
extern void func_0201abd4(int);
extern int  func_0201b7e0(void *);

void func_02017d18(void *o) {
    char *w = GetSystemWork();
    if (!((*(unsigned int *)(w + 0x8d8) << 0x1f) >> 0x1f))
        return;
    if (*(int *)(w + 0x920) == 1) {
        if (func_02019664() != 0x66) return;
        *(int *)((char *)o + 8) = 0x00270100;
        *(int *)(w + 0x900) |= 0x1000000;
        return;
    }
    if (*(int *)(w + 0x920) == 2) {
        if (func_0201b7e0(o) != 4) return;
        *(int *)((char *)o + 8) = 0x00270200;
        func_0201abb0(2);
        func_02018a38(0x13);
        return;
    }
    if (*(int *)(w + 0x920) == 3) {
        if (func_02019664() != 0x65) return;
        if (func_0201969c() != 2) return;
        *(int *)((char *)o + 8) = 0x00270300;
        func_0201abd4(2);
        *(int *)(w + 0x900) &= ~0x1000000;
        func_02018a64();
        return;
    }
}
