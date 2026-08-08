/* data_02102ae4 (12 bytes, 4-aligned): UTF-16LE wide string "-nan\0"
 * + 1 trailing alignment-pad unit (lowercase, signed) -- member 7 of
 * 9 in the same family as data_02102ac8 (see that file for the full
 * family map). Non-const: main's .data spans 0x020c3bc0-0x02102c60
 * (delinks.txt line 4).
 * Consumers (relocs.txt from:/to: proven; transitive callee
 * func_020aee58.s, halfword copy loop):
 *   - func_020ad96c.s:116 (_LIT7, decl :266) -- %a/%A hexfloat
 *     formatter, negative-NaN + lowercase branch.
 *     relocs.txt: from:0x020adcf4 kind:load to:0x02102ae4 module:main.
 *   - func_020ade28.s:155 (_LIT7, decl :470) -- %e/%f/%g decimal
 *     formatter, negative-NaN + lowercase branch.
 *     relocs.txt: from:0x020ae464 kind:load to:0x02102ae4 module:main.
 * Region-checked: NOT referenced by USA/JPN's func_020b0684.s (that
 * function's unrelated table touches 0x02102ae8, not 0x02102ae4).
 */
unsigned short data_02102ae4[6] = {
    0x002d, 0x006e, 0x0061, 0x006e, 0x0000, 0x0000,
};
