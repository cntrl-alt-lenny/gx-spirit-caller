/* data_020ffc54 (16 bytes, 4-aligned): string constant.
 * "No callback." (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02055c70 (relocs.txt from:0x02055d50 kind:load
 * to:0x020ffc54); func_02055d58 (relocs.txt from:0x02055e20 kind:load
 * to:0x020ffc54); func_02055e60 (relocs.txt from:0x02055f7c kind:load
 * to:0x020ffc54).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffc54-0x020ffc64.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffc54[16] = "No callback.";
