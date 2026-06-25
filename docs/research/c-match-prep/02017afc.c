/* CAMPAIGN-PREP candidate for func_02017afc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GetSystemWork bitfield-guard + jump-table dispatch, RMW bit ops, cond stores
 *   risk:       0x8d8&1 guard → `and #1` wall; jump-table layout + `bic;orr` idempotent set + dual cond loads likely diverge
 *   confidence: low
 */
/* func_02017afc: GetSystemWork-singleton handler. r0 = task ptr (-> r5),
 * work -> r4. Requires state[0x920]==1; then w[0x924] jump table (0..4).
 * o[8] = task message id. Shipped as .s (brief 302); 0x8d8 bit0 guard is the
 * mwcc `and #1` wall. The `bic r0,#1; orr r0,#1` is an idempotent bit0 set
 * written as &~1 | 1 to preserve both instructions. */
extern char *GetSystemWork(void);
extern int  func_020195ec(void);
extern int  func_02019664(void);
extern void func_0201abb0(int);
extern void func_0201b7b4(void);
extern int  func_0201b7e0(void *);

void func_02017afc(void *o) {
    char *w = GetSystemWork();
    if (!((*(unsigned int *)(w + 0x8d8) << 0x1f) >> 0x1f))
        return;
    if (*(int *)(w + 0x920) != 1) return;
    switch (*(int *)(w + 0x924)) {
    case 0:
        *(int *)(w + 0x924) = 4;
        /* fallthrough */
    case 3:
        if (func_0201b7e0(o) != 5) return;
        if (func_02019664() != 0x68) return;
        *(int *)((char *)o + 8) = 0x00250100;
        *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
        return;
    case 2:
        if (((*(unsigned int *)(w + 0x8e0) << 0x1f) >> 0x1f)) return;
        if (func_020195ec() == 0)
            *(int *)((char *)o + 8) = 0x00250101;
        else
            *(int *)((char *)o + 8) = 0x00250102;
        return;
    case 1:
        *(int *)((char *)o + 8) = 0x00250103;
        func_0201b7b4();
        func_0201abb0(7);
        return;
    }
}
