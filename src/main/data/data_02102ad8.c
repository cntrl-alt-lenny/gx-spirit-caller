/* data_02102ad8 (12 bytes, 4-aligned): UTF-16LE wide string "-NAN\0"
 * + 1 trailing alignment-pad unit (uppercase, signed) -- member 6 of
 * 9 in the same family as data_02102ac8 (see that file for the full
 * family map). The extra pad unit past the null terminator is dead
 * weight for func_020aee58's copy loop (it stops at the first 0x0000)
 * but is real ROM content required to keep the next symbol 4-aligned
 * (10 content bytes rounded to 12). Non-const: main's .data spans
 * 0x020c3bc0-0x02102c60 (delinks.txt line 4).
 * Consumers (relocs.txt from:/to: proven; transitive callee
 * func_020aee58.s, halfword copy loop):
 *   - func_020ad96c.s:111 (_LIT6, decl :265) -- %a/%A hexfloat
 *     formatter, negative-NaN + uppercase (r6==0x41) branch.
 *     relocs.txt: from:0x020adcf0 kind:load to:0x02102ad8 module:main.
 *   - func_020ade28.s:150 (_LIT6, decl :469) -- %e/%f/%g decimal
 *     formatter, negative-NaN + uppercase branch.
 *     relocs.txt: from:0x020ae460 kind:load to:0x02102ad8 module:main.
 *
 * REGION VARIANCE WARNING (verified directly against real bytes, not
 * assumed): src/usa/main/func_020b0684.s and src/jpn/main/func_020b0684.s
 * (byte-identical .s files, unrelated function) also `.extern` this
 * exact symbol name as part of a 21-entry table. Extracting real bytes
 * from extract/usa/arm9/arm9.bin and extract/jpn/arm9/arm9.bin at
 * 0x02102ad8 (USA and JPN identical) gives ASCII "152587890625\0\0\0\0"
 * -- a decimal-digit string, part of an unrelated dtoa/printf-style
 * powers-of-5 table -- NOT this UTF-16LE "-NAN" string. This carve is
 * EUR-only-safe: src/main/*.c (no region prefix) builds only for the
 * EUR region per tools/configure.py's _is_region_source_excluded rule;
 * USA/JPN keep using their own untouched func_020b0684.s. Do NOT reuse
 * this byte content if data_02102ad8 is ever carved under
 * src/usa/main/ or src/jpn/main/ -- re-extract fresh from that
 * region's arm9.bin.
 */
unsigned short data_02102ad8[6] = {
    0x002d, 0x004e, 0x0041, 0x004e, 0x0000, 0x0000,
};
