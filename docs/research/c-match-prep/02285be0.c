/* CAMPAIGN-PREP candidate for func_02285be0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bic chain => &~A&~B; ternary bit-select 0x16/0x17 from bit21 test; do/while
 *   risk:       permuter-class: heavy reg-pinning — st(r5),base+0x30(r7),opp(r6),total(r8),const1(fp),-1(r4) live across the whole 2nd loop; the bit-select uses movne/moveq r2 then `orr fp,lsl r2` which a C ternary may compile to a branch, and the two `&(-1<<0xd)` masks must stay as r4,lsl#0xd.
 *   confidence: low
 */
/* func_ov002_02285be0 (ov002, class C/D) — two loops, bic flag clears, mla index, stores.
 * First clears two flag bits in each of 5 slots and zeros two counters + a per-slot word.
 * If two guards pass, a second loop sets bit 0x16/0x17 of slot.f40 (per existing bit21),
 * masks two mirror slots, bumps counters, and accumulates a per-slot value. */
typedef unsigned int u32;

extern char data_ov002_022cd524[];
extern char data_ov002_022cf16c[];
extern int  func_ov002_02259f74(int idx);
extern void func_ov002_0228387c(int idx);
extern int  func_ov002_02284b3c(int idx, int arg);

int func_ov002_02285be0(int idx) {
    char *base = data_ov002_022cf16c + (idx & 1) * 0x868;
    char *st   = data_ov002_022cd524;
    char *opp;
    int total = 0;
    int i;
    *(int *)(st + 0x1d0) = 0;
    *(int *)(st + 0x1d4) = 0;
    for (i = 0; i < 5; i++) {
        u32 *f = (u32 *)(base + 0x30 + i * 0x14 + 0x10);
        *f = *f & ~0x400000 & ~0x800000;
        *(int *)(st + 0x1e4 + i * 4) = 0;
    }
    if (func_ov002_02259f74(idx) == 0) return total;
    func_ov002_0228387c(idx);
    if (func_ov002_02284b3c(idx, -1) == 0) return total;
    opp = data_ov002_022cf16c + ((1 - idx) & 1) * 0x868 + 0x30;
    do {
        int a = *(int *)(st + 0x200);
        u32 *w = (u32 *)(base + a * 0x14 + 0x40);
        int sh = ((*w >> 0x16) & 1) ? 0x17 : 0x16;
        *w = *w | (1u << sh);
        if (*(int *)(st + 0x208) != 0) {
            u32 *m = (u32 *)((base + 0x30) + a * 0x14 + 0x10);
            *m = *m & (-1 << 0xd);
            *(int *)(st + 0x1d0) = *(int *)(st + 0x1d0) + 1;
        }
        if (*(int *)(st + 0x20c) != 0) {
            int b2 = *(int *)(st + 0x204);
            u32 *m = (u32 *)(opp + b2 * 0x14 + 0x10);
            *m = *m & (-1 << 0xd);
            *(int *)(st + 0x1d4) = *(int *)(st + 0x1d4) + 1;
        }
        {
            int v = *(int *)(st + 0x214) + 1;
            *(int *)(st + a * 0x14 + 0x1e4) = v;
        }
        total += *(int *)(st + 0x214);
        func_ov002_0228387c(idx);
    } while (func_ov002_02284b3c(idx, -1) != 0);
    return total;
}
