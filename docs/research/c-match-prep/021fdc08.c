/* CAMPAIGN-PREP candidate for func_021fdc08 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: addls pc table -> switch on 6-bit field (kind<<20>>26); nested dup switch in scan loop
 *   risk:       struct-guessed AND truncated: asm body is cut off at .L_3a8 loop (no loop increment / .L_43c body / .L_464 tail / _LIT0 _LIT1 values shown). Cannot reproduce tail; switch-case set and MASK_LIT0 are guesses. struct-guessed.
 *   confidence: low
 */
// func_ov002_021fdc08 - 31-case jump table (cmp #0x1e) on a 6-bit field, then dup table scan loop

typedef struct Ent Ent;
struct Ent {
    unsigned short h0;     // +0x0
    unsigned short kind;   // +0x2  (bits10-15 -> the dispatch index lr)
    unsigned char  pad4[0x10];
    int            field14;// +0x14
};

extern unsigned char data_ov002_022ce288[];   // global; count at +0x5d4, byte array at +0x5dc

// _LIT0 = mask applied to field14; _LIT1 = data_ov002_022ce288
#define MASK_LIT0 0x0000ffff   /* placeholder: exact mask from _LIT0 */

int func_ov002_021fdc08(Ent *r0)
{
    // lr = (kind << 20) >> 26  -> bits 10..15 of kind (6-bit field)
    unsigned int lr = ((unsigned int)(r0->kind << 20)) >> 26;
    int r4;
    switch (lr) {
        case 7: case 8: case 9:
        case 12: case 13:
        case 23:
        case 26: case 27: case 28: case 29: case 30:
            r4 = r0->field14 & MASK_LIT0;
            break;
        default:
            return 0;
    }

    {
        unsigned char *g = data_ov002_022ce288;
        unsigned int n = *(unsigned int *)(g + 0x5d4);
        if (n == 0)
            return 0;
        {
            unsigned int i;
            for (i = 0; i < n; i++) {
                unsigned int kb = g[0x5dc];   // ldrb [ip,#0x5dc]
                if (lr == kb) {
                    switch (kb) {
                        case 7: case 8: case 9:
                        case 12: case 13:
                        case 23:
                            /* matched-kind body (.L_43c) - truncated in source asm */
                            break;
                        default:
                            break;  /* .L_454 continue */
                    }
                }
            }
        }
        (void)r4;
        return 0;
    }
}
