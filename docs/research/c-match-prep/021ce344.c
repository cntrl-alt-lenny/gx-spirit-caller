/* CAMPAIGN-PREP candidate for func_021ce344 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: masked-field RMW store FIRST; two bitfield extracts (v<<23)>>28/(v<<19)>>28; reuse shared mask literal.
 *   risk:       reshape-able: the cmp uses two nibble extracts of the same v -- if mwcc folds one to lsr;and the cmp's shifted-operand form (cmp r2,r1,lsr#28) diverges; keep both as (v<<k)>>28.
 *   confidence: med
 */
/* func_ov011_021ce344 (ov011, class D): set one masked field, then compare two
 * nibble bitfields of g4000[0x2a4] and pick one of two masked stores.
 *   g4000[0x2b0] = (g4000[0x2b0] & 0xffe01fff) | 0x2000;     [store FIRST]
 *   v = g4000[0x2a4];
 *   if (((v>>5)&0xf) != ((v>>9)&0xf)) { func_ov011_021ceffc(); return; }
 *   g403c[0x274] = (g403c[0x274] & 0xffe01fff) | 0x4000;
 * The mask 0xffe01fff is reused for both fields (orig keeps it in r0 across the
 * branch); the two extracts are written as (v<<23)>>28 / (v<<19)>>28 pairs. */
extern void func_ov011_021ceffc(void);
extern unsigned char data_ov011_021d4000[];
extern unsigned char data_ov011_021d403c[];

void func_ov011_021ce344(void) {
    unsigned int *p2b0;
    unsigned int v;
    unsigned int *p274;

    p2b0 = (unsigned int *)(data_ov011_021d4000 + 0x2b0);
    *p2b0 = (*p2b0 & 0xffe01fffu) | 0x2000;

    v = *(unsigned int *)(data_ov011_021d4000 + 0x2a4);
    if (((v << 23) >> 28) != ((v << 19) >> 28)) {
        func_ov011_021ceffc();
        return;
    }

    p274 = (unsigned int *)(data_ov011_021d403c + 0x274);
    *p274 = (*p274 & 0xffe01fffu) | 0x4000;
}
