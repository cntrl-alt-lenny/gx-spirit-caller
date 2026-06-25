/* CAMPAIGN-PREP candidate for func_02017888 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GetSystemWork bitfield-guard + cmp/beq chain + jump-table substate
 *   risk:       0x8d8&1 guard → `and #1` wall; substate jump-table + repeated-call CSE + cond loads likely diverge
 *   confidence: low
 */
/* func_02017888: GetSystemWork-singleton state handler. r0 = task ptr.
 * w[0x920] primary state via cmp/beq (1,2,3); state 3 -> w[0x924] jump table
 * (0..5). o[8] = task message id. Shipped as .s (brief 302); 0x8d8 bit0
 * guard is the documented mwcc `and #1` wall. Note the THREE separate calls
 * to func_020190c0 in state 1 (not CSE'd) -> distinct call sites in C. */
extern char *GetSystemWork(void);
extern int  func_020139c4(void);
extern int  func_02019034(void);
extern int  func_020190c0(void);
extern int  func_020190ec(void);
extern int  func_020195ec(void);
extern void func_02019640(int);
extern int  func_02019664(void);
extern void func_0201aabc(int);
extern void func_0201aaf4(int);
extern void func_0201ab5c(int);
extern void func_0201b7b4(void);
extern int  func_0201b7e0(void *);
extern int  func_ov000_021ae4ac(void);

void func_02017888(void *o) {
    char *w = GetSystemWork();
    if (!((*(unsigned int *)(w + 0x8d8) << 0x1f) >> 0x1f))
        return;
    if (*(int *)(w + 0x920) == 1) {
        if (func_020190c0() != 1 && func_020190c0() != 2 && func_020190c0() != 3)
            return;
        if (func_020139c4() != 5) return;
        if ((unsigned int)func_02019034() >= (unsigned int)(*(int *)(w + 0x8dc) + 1))
            *(int *)((char *)o + 8) = 0x00230100;
        return;
    }
    if (*(int *)(w + 0x920) == 2) {
        if (func_0201b7e0(o) != 4) return;
        *(int *)((char *)o + 8) = 0x00230200;
        func_0201b7b4();
        return;
    }
    if (*(int *)(w + 0x920) == 3) {
        switch (*(int *)(w + 0x924)) {
        case 0:
            *(int *)(w + 0x924) = 5;
            /* fallthrough */
        case 5:
            if (func_020190ec() == 0) return;
            if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(w + 0x8dc) + 1)) return;
            if (func_020139c4() != 5) return;
            *(int *)((char *)o + 8) = 0x00230300;
            *(int *)(w + 0x900) |= 0x1000000;
            func_0201aabc(0x7b);
            return;
        case 3:
            if (func_0201b7e0(o) != 3) return;
            if (func_02019664() != 0x7b) return;
            *(int *)((char *)o + 8) = 0x00230301;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 2:
            if (func_ov000_021ae4ac() == 2) {
                *(int *)(w + 0x91c) = 0x23;
                *(int *)(w + 0x920) = 3;
                *(int *)(w + 0x924) = 4;
                *(int *)(w + 0x8e0) |= 4;
                func_02019640(0);
                return;
            }
            if (((*(unsigned int *)(w + 0x8e0) << 0x1f) >> 0x1f)) return;
            if (func_020195ec() == 0)
                *(int *)((char *)o + 8) = 0x00230302;
            else
                *(int *)((char *)o + 8) = 0x00230303;
            return;
        case 1:
            *(int *)((char *)o + 8) = 0x00230304;
            func_0201b7b4();
            func_0201aaf4(0x7b);
            func_0201ab5c(2);
            *(int *)(w + 0x900) &= ~0x1000000;
            return;
        }
    }
}
