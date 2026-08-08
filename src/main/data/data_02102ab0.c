/* data_02102ab0 (12 bytes, 4-aligned): UTF-16LE NUL-terminated wide
 * string "-INF" (negative infinity, uppercase form for %A/%E/%F/%G),
 * 6 x unsigned short (4 code units + NUL + one extra padding NUL unit,
 * since "-INF\0" is only 10 bytes and the next symbol, data_02102abc,
 * must start 4-byte aligned). Second of the 9-member special-float-
 * value string family; see data_02102aa4's header comment for the
 * family layout and type-convention rationale.
 * Consumers: func_020ad96c (%a/%A hexfloat), src/main/func_020ad96c.s:75
 * (_LIT2, uppercase-format branch) (relocs.txt:18609 from:0x020adce0
 * kind:load to:0x02102ab0 module:main); also func_020ade28 (%e/%f/%g
 * decimal), src/main/func_020ade28.s:100 (_LIT2) (relocs.txt:18634
 * from:0x020ae450 kind:load to:0x02102ab0 module:main).
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
unsigned short data_02102ab0[6] = {
    0x002d, 0x0049, 0x004e, 0x0046, 0x0000, 0x0000,
};
