/* data_020fe8f8 (12 bytes, 4-aligned): HTTP header-line format string
 * "%s: %s\r\n", followed by 4 trailing NUL bytes (past the 1 a plain
 * string literal would supply -- kept as a raw byte array for exact byte
 * fidelity). Immediately precedes data_020fe904.c in ROM
 * (0x020fe8f8 + 12 == 0x020fe904) but remains a separate linker symbol.
 * Consumer: func_020416f8 (main; not yet landed as matched C --
 * src/main/func_020416f8.s, real assembly):
 *     .extern data_020fe8f8
 *     _LIT1: .word data_020fe8f8
 *     ldr r0, _LIT1            ; used as the sprintf/vsnprintf fmt arg
 *   func_020416f8(void *arg0, const char *arg1, const char *arg2) is
 *   called from the already-landed src/main/func_02041fd0.c:18 as
 *   func_020416f8(arg0, data_020fe9bc, data_020fe9c8) -- consistent with
 *   arg1/arg2 being a header-name/header-value pair formatted through
 *   this "%s: %s\r\n" string and appended to a request buffer at
 *   self+0x19f4 (same Buf offset seen in func_020417e8's dossier).
 * relocs.txt: `from:0x020417e0 kind:load to:0x020fe8f8 module:main`
 * (config/eur/arm9/relocs.txt:6621).
 * Not const: inside main's .data span (delinks.txt line 4). 4-aligned.
 */
unsigned char data_020fe8f8[12] = {
    0x25, 0x73, 0x3a, 0x20, 0x25, 0x73, 0x0d, 0x0a, 0x00, 0x00, 0x00, 0x00,
};
