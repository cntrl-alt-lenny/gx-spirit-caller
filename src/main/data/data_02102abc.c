/* data_02102abc (12 bytes, 4-aligned): UTF-16LE NUL-terminated wide
 * string "-inf" (negative infinity, lowercase form for %a/%e/%f/%g),
 * 6 x unsigned short (4 code units + NUL + one extra padding NUL unit,
 * mirroring data_02102ab0's "-INF" sibling). Third of the 9-member
 * special-float-value string family; see data_02102aa4's header comment
 * for the family layout and type-convention rationale.
 * Consumers: func_020ad96c (%a/%A hexfloat), src/main/func_020ad96c.s:80
 * (_LIT3, lowercase-format branch) (relocs.txt:18610 from:0x020adce4
 * kind:load to:0x02102abc module:main); also func_020ade28 (%e/%f/%g
 * decimal), src/main/func_020ade28.s:105 (_LIT3) (relocs.txt:18635
 * from:0x020ae454 kind:load to:0x02102abc module:main).
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
unsigned short data_02102abc[6] = {
    0x002d, 0x0069, 0x006e, 0x0066, 0x0000, 0x0000,
};
