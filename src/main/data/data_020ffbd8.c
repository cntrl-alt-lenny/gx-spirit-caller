/* data_020ffbd8 (32 bytes, 4-aligned): string constant.
 * "OS_IsTickAvailable() == TRUE" (28 chars + NUL, zero-padded to 32 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_02054b9c (relocs.txt from:0x02054bec kind:load
 * to:0x020ffbd8); func_02055330 (relocs.txt from:0x0205537c kind:load
 * to:0x020ffbd8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffbd8-0x020ffbf8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffbd8[32] = "OS_IsTickAvailable() == TRUE";
