/* data_02102aa4 (12 bytes, 4-aligned): UTF-16LE NUL-terminated wide
 * string "0x0p0" (hexfloat rendering of a zero mantissa/exponent, i.e.
 * the %a/%A formatter's fixed-text output for the value 0.0), 6 x
 * unsigned short (5 code units + NUL, already 4-aligned so no padding
 * unit is needed -- contrast data_02102ab0/data_02102abc below, which
 * DO carry one padding NUL). First of a 9-member special-float-value
 * string family spanning 0x02102aa4-0x02102b00 (92 bytes -- the
 * delinks.txt gap between data_02102aa0.c and data_02102b00.c matches
 * exactly); the other 6 members (data_02102ac8..data_02102af8) are a
 * separate carve (Group F2). Declared as a plain unsigned short[] hex
 * initializer (matching this project's existing u16-table convention,
 * e.g. data_020c398c.c / data_020b46a0.c) rather than a quoted string
 * literal -- no established wide-string-literal precedent exists in
 * this codebase, and the raw-hex form sidesteps any mwcc
 * source-charset transcoding risk (same reasoning as
 * data_ov004_02209fd0.c's Shift-JIS convention, generalized to
 * UTF-16LE).
 * Consumer: func_020ad96c (%a/%A wide hexfloat formatter),
 * src/main/func_020ad96c.s:57 (_LIT1, `func_020aee58(dst,
 * data_02102aa4)` -- a u16-stride wide strcpy, taken on the
 * value-is-zero path) (relocs.txt:18608 from:0x020adcdc kind:load
 * to:0x02102aa4 module:main).
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
unsigned short data_02102aa4[6] = {
    0x0030, 0x0078, 0x0030, 0x0070, 0x0030, 0x0000,
};
