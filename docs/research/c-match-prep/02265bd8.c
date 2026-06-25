/* CAMPAIGN-PREP candidate for func_02265bd8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     state switch via if-chain; movne/moveq->ternary; u16 mmio pack helper; reload base per arm
 *   risk:       struct-guessed: the batch asm is TRUNCATED (90/~?? lines) — the .L_134 default arm, the 3rd func_021d479c call's full args, the return value, and _LIT3 (b3ecc 3rd arg const) are ALL missing. This TU cannot byte-match until the full asm is re-extracted.
 *   confidence: low
 */
// func_ov002_02265bd8 — state switch, MMIO pack (PARTIAL: asm truncated at brief)
// NOTE: batch asm ends mid-third-branch; .L_134 body and _LIT defs are MISSING.
// Reconstructed from the visible state-0/state-1 arms + the two repeated
// 'movne 0x8000 / orr 0xb / lsl16 / func_021d479c' MMIO writes.
extern unsigned char data_ov002_022cd524[];
extern unsigned char data_ov002_022cd744[];
extern unsigned char data_ov002_022d016c[];
extern int func_ov002_021b3ecc(int a, int b, int c);
extern void func_ov002_021d479c(int a, int b, int c, int d);
extern void func_ov002_021e2d20(int a, int b, int c);
extern void func_ov002_0229cd5c(int a, int b);

#define GD ((unsigned char *)data_ov002_022d016c)

static unsigned mmio_pack(int cond, unsigned orbits)
{
    unsigned v = cond ? 0x8000u : 0u;   /* movne 0x8000 / moveq 0 */
    v |= orbits;
    return (v << 0x10) >> 0x10;          /* lsl#0x10;lsr#0x10 -> u16 */
}

int func_ov002_02265bd8(void)
{
    int state = *(int *)(GD + 0xd20);
    int r4    = *(int *)(GD + 0xcec);

    if (state == 0) {
        func_ov002_021d479c(mmio_pack(r4, 0x2), 0, 0, 0);
        if (*(int *)((unsigned char *)data_ov002_022cd524 + (r4 << 2)) == 1)
            func_ov002_0229cd5c((int)data_ov002_022cd744, 0x218);
        {
            int *q = (int *)(GD + 0xd20);
            *q = *q + 1;
        }
        return 0;
    }

    if (state == 1) {
        if (func_ov002_021b3ecc(r4, 0xb, /*_LIT3 const*/0) != 0)
            func_ov002_021e2d20(r4, 0x18, 1);

        if (*(int *)(GD + 0xd04) != 1) {
            int a = *(int *)(GD + 0xcf4);
            int b = *(int *)(GD + 0xcf0);
            if (b == a + 1)
                func_ov002_021d479c(mmio_pack(r4, 0xb), 1, 0, 0);
        }
        {
            int a = *(int *)(GD + 0xcf4);
            int b = *(int *)(GD + 0xcf0);
            if (b == a + 4) {
                /* TRUNCATED: third MMIO write begins here, body not in batch */
                (void)mmio_pack(r4, 0xb);
            }
        }
    }
    return 0;
}
