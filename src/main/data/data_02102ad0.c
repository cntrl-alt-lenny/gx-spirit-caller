/* data_02102ad0 (8 bytes, 4-aligned): UTF-16LE wide string "inf\0"
 * (lowercase, unsigned) -- member 5 of 9 in the same family as
 * data_02102ac8 (see that file for the full family map). Non-const:
 * main's .data spans 0x020c3bc0-0x02102c60 (delinks.txt line 4).
 * Consumers (relocs.txt from:/to: proven; transitive callee
 * func_020aee58.s, halfword copy loop):
 *   - func_020ad96c.s:93 (_LIT5, decl :264) -- %a/%A hexfloat
 *     formatter, positive-infinity + lowercase branch.
 *     relocs.txt: from:0x020adcec kind:load to:0x02102ad0 module:main.
 *   - func_020ade28.s:126 (_LIT5, decl :468) -- %e/%f/%g decimal
 *     formatter, positive-infinity + lowercase branch.
 *     relocs.txt: from:0x020ae45c kind:load to:0x02102ad0 module:main.
 * Region-checked: NOT referenced by USA/JPN's func_020b0684.s (that
 * function's unrelated table touches 0x02102ad8, not 0x02102ad0).
 */
unsigned short data_02102ad0[4] = {
    0x0069, 0x006e, 0x0066, 0x0000,
};
