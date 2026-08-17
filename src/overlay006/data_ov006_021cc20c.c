/* data_ov006_021cc20c (92 bytes, 4-aligned): short[46], cm-restock-carve-8.
 * Consumer: func_ov006_021c0c14.s, `ldr r1,_LIT2(data_ov006_021cc20c);
 * mov r2,fp,lsl#0x1; add r1,r1,r0; ldrsh r1,[r2,r1]` -- confirmed
 * 2-byte (`ldrsh`) element access, double-indexed (an outer stride of
 * 0x12 bytes multiplied against a sibling struct field, `fp` as a
 * secondary 2-byte-stride index). The exact 2-D record shape isn't
 * pinned down by this reader alone (the outer multiplier's range comes
 * from runtime state, not a static bound) -- shipped as a flat
 * short[46], matching this project's standing convention for a
 * confirmed-element-size-but-unresolved-dimensionality array (element
 * type/size has real reader evidence; the array's internal grouping
 * does not, and isn't invented here). relocs.txt: single load reloc
 * matching the consumer's own literal pool, zero internal relocations
 * inside this symbol's own span (pure value data, confirmed -- values
 * are exclusively 0/1, consistent with a flag/state table). Kept
 * non-const, matching the symbol's own prior non-const declaration
 * (.data ground truth).
 */
short data_ov006_021cc20c[46] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
    0, 1, 0, 0, 0, 0, 0, 1, 1, 1,
    0, 1, 1, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0,
};
