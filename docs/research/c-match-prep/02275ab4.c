/* CAMPAIGN-PREP candidate for func_02275ab4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C scaffold: slot.id :13, packed16 scan, :15-disc dispatch decode
 *   risk:       struct-guessed/TRUNCATED: batch JSON cuts off at .L_120 — the four dispatch arms, _LIT3's discriminant base value, and the epilogue are absent, so the tail cannot byte-match yet. Visible prefix (guard + packed16 scan + disc=(word0>>8)&0x7fff) is faithful; fill arms from full disasm.
 *   confidence: low
 */
/* func_ov002_02275ab4: SCAFFOLD — batch asm is TRUNCATED at .L_120 (size 372 /
 * ~89 insns; only ~74 shown). The 4-way dispatch arms (.L_120/.L_134/.L_148/
 * .L_15c), _LIT3's value, and the epilogue are ABSENT from the batch JSON.
 * This TU encodes only the visible prefix + the dispatch decode; fill the
 * arms (each calls a handler with player/row args) from the full disasm.
 * Mirrors the precedent in func_ov002_021d4f18.c. cls C. */
struct Ov002Slot { unsigned int id : 13; };
struct CD300 { unsigned bit0:1; unsigned pad:7; unsigned f8:15; unsigned hi:9; };
extern char data_ov002_022cd300[];   /* _LIT2 */
extern char data_ov002_022cf16c[];   /* _LIT0 row table */
#define OV002_DISP_BASE 0            /* _LIT3: discriminant base (unknown -- truncated) */
extern int func_ov002_021bc288(int player, int row);
extern int func_ov002_021bc68c(void);
/* dispatch-arm handlers (.L_120..): signatures unknown from the truncated tail */
int func_ov002_02275ab4(int player, int a, int b) {
    int sum = a + b;
    int disc;
    int count;
    int i;
    unsigned short packed;
    if (sum > 10) return 0;
    if (((struct Ov002Slot *)(data_ov002_022cf16c + (player & 1) * 0x868
                              + sum * 0x14 + 0x30))->id == 0) return 0;
    count = (unsigned char)data_ov002_022cd300[0x8];
    if (count == 0) {
        if (func_ov002_021bc68c() == 0) {
            if (player != (int)((struct CD300 *)data_ov002_022cd300)->bit0) return 0;
            if (sum > 4) return 0;
            if (func_ov002_021bc288(player, sum) == 0) return 0;
            /* falls through to dispatch (.L_e8) */
        }
        /* else -> dispatch (.L_e8) */
    } else {
        packed = (unsigned short)((player & 0xff) | ((sum & 0xff) << 8));
        for (i = 0; i < count; i++) {
            if (packed == *(unsigned short *)(data_ov002_022cd300 + 0x10 + i * 2))
                return 0;
        }
    }
    /* .L_e8: 4-way dispatch on the :15 field at bit 8 of word0 */
    disc = ((struct CD300 *)data_ov002_022cd300)->f8;
    if (disc == OV002_DISP_BASE) {
        /* .L_120: handler(player, arg1) -- TRUNCATED */
    } else if (disc == OV002_DISP_BASE + 1) {
        /* .L_134 -- TRUNCATED */
    } else if (disc == OV002_DISP_BASE + 0x25) {
        /* .L_148 -- TRUNCATED */
    }
    /* .L_15c default -- TRUNCATED */
    return 0;
}
