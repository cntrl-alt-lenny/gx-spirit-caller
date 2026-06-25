/* CAMPAIGN-PREP candidate for func_0200a2f4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D divmod: smull-magic /80 then %80, *6 stride; rsb #0x4f, byte-test low 8 bits
 *   risk:       struct-guessed: data_02106810 base + 0x1a00 sub-struct offsets (0xa4 limit, 0xa6 wrap) and data_02104f4c as a 6-byte-entry table are inferred from ldrh offsets. The /80 magic itself is solid; the struct shape and return type (ptr vs index) need confirming.
 *   confidence: low
 */
extern unsigned short data_0210693c[];
extern unsigned char data_02104f4c[];
extern unsigned char data_02106810[];

unsigned char *func_0200a2f4(int sel)
{
    unsigned short count;
    unsigned short limit;
    int idx;
    unsigned short *entry;

    count = data_0210693c[0xb4 / 2];
    if (count == 0)
        return 0;
    limit = *(unsigned short *)(data_02106810 + 0x1a00 + 0xa4);
    if (sel >= limit)
        return 0;
    idx = (*(unsigned short *)(data_02106810 + 0x1a00 + 0xa6) + (0x4f - sel)) % 80 * 6;
    entry = (unsigned short *)(data_02104f4c + idx);
    if ((*entry & 0xff) == 0)
        return 0;
    return data_02104f4c + idx;
}
