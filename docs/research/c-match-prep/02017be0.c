/* CAMPAIGN-PREP candidate for func_02017be0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GetSystemWork bitfield-guard + jump-table + nested bit2 tests, cond substate dec
 *   risk:       0x8d8&1 / 0x8e0 bit-tests → `and` wall; jump-table + `subeq` conditional substate decrement likely diverge
 *   confidence: low
 */
/* func_02017be0: GetSystemWork-singleton handler. r0 = task ptr (-> r5),
 * work -> r4. state[0x920]==1; w[0x924] jump table (0..4). o[8] = message id.
 * w[0x8e0] bit0 = (v<<31)>>31, bit1 = (v<<30)>>31. Shipped as .s (brief 302);
 * 0x8d8/0x8e0 bit tests are the mwcc `and` wall. */
extern char *GetSystemWork(void);
extern int  func_020195ec(void);
extern void func_02019640(int);
extern int  func_02019664(void);
extern int  func_0201969c(void);
extern void func_0201abd4(int);
extern void func_0201b7b4(void);

void func_02017be0(void *o) {
    char *w = GetSystemWork();
    if (!((*(unsigned int *)(w + 0x8d8) << 0x1f) >> 0x1f))
        return;
    if (*(int *)(w + 0x920) != 1) return;
    switch (*(int *)(w + 0x924)) {
    case 0:
        *(int *)(w + 0x924) = 4;
        /* fallthrough */
    case 3:
        if (func_02019664() != 0x65) return;
        if (func_0201969c() != 7) return;
        *(int *)((char *)o + 8) = 0x00260100;
        *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
        return;
    case 2:
        if (((*(unsigned int *)(w + 0x8e0) << 0x1f) >> 0x1f)) return;
        if (func_020195ec() != 0) {
            *(int *)((char *)o + 8) = 0x00260102;
            return;
        }
        *(int *)((char *)o + 8) = 0x00260104;
        if (((*(unsigned int *)(w + 0x8e0) << 0x1e) >> 0x1f) == 0)
            *(int *)(w + 0x924) = *(int *)(w + 0x924) - 1;
        func_0201b7b4();
        func_0201abd4(7);
        return;
    case 1:
        *(int *)((char *)o + 8) = 0x00260103;
        if (((*(unsigned int *)(w + 0x8e0) << 0x1e) >> 0x1f) == 0) {
            *(int *)(w + 0x920) = 1;
            *(int *)(w + 0x924) = 5;
        }
        if (((*(unsigned int *)(w + 0x8e0) << 0x1e) >> 0x1f)) return;
        func_02019640(0);
        return;
    }
}
