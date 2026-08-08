/* data_020fe45c (12 bytes, 4-aligned): plain byte lookup table -- NOT a
 * string and NOT a ResTableEntry family member (both hypotheses refuted
 * by consumer evidence). Bytes: {0,0,1,1,7,7,7,1,7,7,1,0}.
 * Consumer: func_020318b8 (main, HIGH class A, 116B; not yet landed as
 * matched C -- see docs/research/dossiers-high/020318b8.md +
 * docs/research/c-match-prep/020318b8.c). GROUND TRUTH (from .s) lists
 * `.L_02031920 = data_020fe45c` as a real literal-pool entry:
 *     ldr r6,=data_020fe45c
 *  loop (0xC iterations):
 *     ldrb r0,[r6],#1        ; read one byte, post-increment
 *     ...
 *     str  r0,[r5,#0x60]     ; store into a per-entry table slot
 *     add  r5,r5,#0x64       ; advance to next 0xC-entry-table slot
 * i.e. exactly 12 sequential byte reads (matches size=12 exactly, zero
 * slack), one byte consumed per loop iteration and stored into a
 * table-entry field -- confirms a flat byte array, not a struct.
 * relocs.txt: `from:0x02031920 kind:load to:0x020fe45c module:main`
 * (config/eur/arm9/relocs.txt:4791).
 * CORRECTION vs the unlanded prep draft: docs/research/c-match-prep/
 * 020318b8.c declares `extern const unsigned char data_020fe45c[];`.
 * That `const` is wrong per this project's section-discipline rule --
 * 0x020fe45c is inside main's .data span 0x020c3bc0-0x02102c60
 * (delinks.txt line 4), not .rodata, so this definition must stay
 * non-const (a const definition would itself relocate to .rodata and
 * break byte-identity, independent of how any one consumer's extern
 * happens to be qualified). 4-aligned.
 */
unsigned char data_020fe45c[12] = {
    0x00, 0x00, 0x01, 0x01, 0x07, 0x07, 0x07, 0x01, 0x07, 0x07, 0x01, 0x00,
};
