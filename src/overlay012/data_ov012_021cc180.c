/* data_ov012_021cc180 (104 bytes, 4-aligned): retyped from opaque bytes to
 * a 26-slot pointer table as part of cm-data-inference-6. relocs.txt
 * proves elements [0..15] are real relocated pointers (all targeting
 * uncarved data_ov012_* gap symbols) and elements [16..25] are literal
 * NULL (no relocation at those addresses) -- same method and raw-literal-
 * cast strategy as already-shipped sibling data_ov012_021cc1e8
 * (cm-data-inference-3). Elements [0..11] additionally corroborated by
 * genuine shipped consumer func_ov012_021ca964.s:105-119,387 (fixed
 * 12-word block copy, passed by pointer to func_0201ef90). None of the
 * 16 pointer targets are carved yet, hence raw address-literal casts
 * rather than `&symbol` references.
 */

void *const data_ov012_021cc180[26] = {
    (void *)0x021cc444, (void *)0x021cc45c, (void *)0x021cc474, (void *)0x021cc48c,
    (void *)0x021cc36c, (void *)0x021cc308, (void *)0x021cc344, (void *)0x021cc31c,
    (void *)0x021cc564, (void *)0x021cc580, (void *)0x021cc59c, (void *)0x021cc5b8,
    (void *)0x021cc504, (void *)0x021cc4a4, (void *)0x021cc4ec, (void *)0x021cc2a0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};
