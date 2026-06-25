/* CAMPAIGN-PREP candidate for func_02095c18 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT/CLEAR counted loop; {u32,u32,u8} stride 0xC array
 *   risk:       loop induction may keep counter+base in different regs or hoist base; stride 0xC implies 4-byte struct align.
 *   confidence: med
 */
// func_02095c18 — counted clear loop over 8 x 0xC structs
// Recipe: INIT/CLEAR counted loop, struct {u32;u32;u8} stride 0xC.

typedef struct {
    unsigned int a;
    unsigned int b;
    unsigned char c;
} Entry021a8220;

extern Entry021a8220 data_021a8220[8];

void func_02095c18(void)
{
    int i;

    for (i = 0; i < 8; i++) {
        data_021a8220[i].a = 0;
        data_021a8220[i].b = 0;
        data_021a8220[i].c = 0;
    }
}
