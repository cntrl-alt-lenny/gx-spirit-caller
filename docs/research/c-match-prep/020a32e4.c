/* CAMPAIGN-PREP candidate for func_020a32e4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT/CLEAR byte stores in asm store-order
 *   risk:       struct offsets guessed; mwcc could coalesce the 5 byte-stores into a word store if alignment lets it — would diverge
 *   confidence: med
 */
/* func_020a32e4 — clear 5 consecutive bytes (offsets 0xd..0x11) in data_021a9850.
 * Leaf -> default mwcc 2.0/sp1p5 (plain .c). STORE-ORDER recipe.
 */

typedef struct {
    char _pad00[0xd];
    unsigned char f_d;      /* +0xd */
    unsigned char f_e;      /* +0xe */
    unsigned char f_f;      /* +0xf */
    unsigned char f_10;     /* +0x10 */
    unsigned char f_11;     /* +0x11 */
} data_021a9850_t;

extern data_021a9850_t data_021a9850;

void func_020a32e4(void)
{
    data_021a9850.f_d  = 0;
    data_021a9850.f_e  = 0;
    data_021a9850.f_f  = 0;
    data_021a9850.f_10 = 0;
    data_021a9850.f_11 = 0;
}
