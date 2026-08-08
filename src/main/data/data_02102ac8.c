/* data_02102ac8 (8 bytes, 4-aligned): UTF-16LE wide string "INF\0"
 * (uppercase, unsigned) -- member 4 of 9 in the special-float-value
 * string family spanning 0x02102aa4-0x02102b00 ("0x0p0", "-INF",
 * "-inf", "INF", "inf", "-NAN", "-nan", "NAN", "nan"); siblings
 * 0x02102aa4/ab0/abc are carved separately (Group F1). Non-const:
 * main's .data spans 0x020c3bc0-0x02102c60 (delinks.txt line 4).
 * Consumers (relocs.txt from:/to: proven; transitive callee
 * func_020aee58.s -- an ldrh/strh halfword copy loop that stops at
 * the first 0x0000 unit):
 *   - func_020ad96c.s:88 (_LIT4, decl :263) -- %a/%A hexfloat
 *     formatter, positive-infinity + uppercase (r6==0x41) branch.
 *     relocs.txt: from:0x020adce8 kind:load to:0x02102ac8 module:main.
 *   - func_020ade28.s:121 (_LIT4, decl :467) -- %e/%f/%g decimal
 *     formatter, positive-infinity + uppercase (ctype bit 0x200 of
 *     data_020c398c) branch.
 *     relocs.txt: from:0x020ae458 kind:load to:0x02102ac8 module:main.
 * Region-checked: NOT referenced by USA/JPN's func_020b0684.s (that
 * function's unrelated table touches 0x02102ac0, not 0x02102ac8).
 */
unsigned short data_02102ac8[4] = {
    0x0049, 0x004e, 0x0046, 0x0000,
};
