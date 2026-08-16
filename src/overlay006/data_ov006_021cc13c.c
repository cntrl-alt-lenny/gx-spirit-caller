/* data_ov006_021cc13c (40 bytes, 4-aligned): plain int[10], cm-restock-carve-8.
 * Consumer: func_ov006_021bcedc.s, `ldr r5,_LIT9(data_ov006_021cc13c);
 * ldr r8,[r5,r3,lsl#0x2]` -- classic 4-byte-stride indexed load, `r3`
 * an index variable from `[sp,#0x1c]`. relocs.txt: single load reloc
 * matching the consumer's own literal pool, zero internal relocations
 * inside this symbol's own span (pure scalar value data, confirmed --
 * not a pointer table despite the ARM9-address-range coincidence
 * checked and ruled out for the sibling data_ov006_021cb60c). Values
 * are a simple ascending 0..8 run with a trailing 0, real ROM bytes.
 * Kept non-const, matching the symbol's own prior non-const declaration
 * (.data ground truth).
 */
int data_ov006_021cc13c[10] = {
    0, 1, 2, 3, 4, 5, 6, 7, 8, 0,
};
