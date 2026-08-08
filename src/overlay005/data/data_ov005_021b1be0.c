/* data_ov005_021b1be0 (8 bytes, 4-aligned): short Shift-JIS UI-label
 * buffer -- decodes to "戻る" ("Back"/"Return", a common menu-label word),
 * NUL-terminated + zero-padded to 8 bytes. Passed by ADDRESS (never
 * struct-dereferenced) to two calls in the same block: first as the text
 * arg to func_020054a4 (cross-overlay naming + its own disassembly, which
 * calls a callback-based per-character iterator func_02004ef4, both point
 * to a text-width helper -- NOTE: docs/research/map/main_a.md's
 * "IRQ_SetVector" label for this same address is contradicted by both the
 * .s body and 10+ consistent overlay call sites, and should not be
 * trusted), then as the text arg to func_02004f58 -- the same two-call
 * shape the file uses immediately above for func_0202c0c0's ("glyph",
 * per ov005_core.h) resolved-string results.
 * Consumer: src/overlay005/func_ov005_021adf3c.s:261,273 (`_LIT7`,
 *   declared :452) -- proven by
 *   config/eur/arm9/overlays/ov005/relocs.txt:355
 *   `from:0x021ae580 kind:load to:0x021b1be0 module:overlay(5)`.
 * Word[0] (0xe982df96) is outside the 0x02xxxxxx ARM9 address range and
 * has no outgoing reloc -- confirmed not a pointer, just SJIS bytes.
 * .data-resident: config/eur/arm9/overlays/ov005/delinks.txt `.data
 *   start:0x021b17e0 end:0x021b1d40` covers 0x021b1be0 -- NOT const.
 * Kept as a plain byte array, not a `char[] = "..."` string literal --
 * embedding raw Shift-JIS bytes in a quoted literal risks silent
 * mis-transcoding (project convention; see src/main/data/data_020c5934.c).
 */
unsigned char data_ov005_021b1be0[8] = {
    0x96, 0xdf, 0x82, 0xe9, 0x00, 0x00, 0x00, 0x00,
};
