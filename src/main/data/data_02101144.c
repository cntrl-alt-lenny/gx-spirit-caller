/* data_02101144 (48 bytes, 4-aligned): string constant.
 * "Could not resolve search mananger host name." (44 chars + NUL,
 * zero-padded to 48 bytes (automatic from array size > literal length)).
 * Reader(s): func_0205fb88 (relocs.txt from:0x0205fd80 kind:load
 * to:0x02101144).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101144-0x02101174.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101144[48] = "Could not resolve search mananger host name.";
