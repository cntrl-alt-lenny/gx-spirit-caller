/* data_0210283c (8 bytes, 4-aligned): IEEE-754 binary64 bit pattern for
 * +Infinity (0x7FF0000000000000; little-endian lo word 0x00000000, hi
 * word 0x7ff00000). Declared as a raw byte array rather than a native
 * `double` literal -- this codebase has zero precedent anywhere for a
 * C-level floating-point literal initializer; every other exact-bit-
 * pattern numeric/text constant found (e.g. data_02101598.c,
 * data_02101dcc.c) ships as a raw byte array or a whole-file .s blob,
 * so getting mwcc to constant-fold an arbitrary double expression to
 * this exact pattern would be an unnecessary, unverified risk versus
 * just shipping the bytes.
 * Consumer: func_020ab130 (strtod-style ASCII-to-double parser),
 * src/main/func_020ab130.s:1148,1152 (_LIT8, `ldmia r1, {r0, r1}` loads
 * this blob into the r0:r1 double-return register pair on the overflow
 * path, i.e. this is the HUGE_VAL / overflow return value)
 * (relocs.txt:18563 from:0x020ac130 kind:load to:0x0210283c
 * module:main).
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
unsigned char data_0210283c[8] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf0, 0x7f,
};
