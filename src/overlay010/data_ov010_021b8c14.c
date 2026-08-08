/* data_ov010_021b8c14 (12 bytes, 4-aligned): single-character placeholder
 * template ("#") searched via func_020a6a28 (a strstr(a,b)-equivalent --
 * traced transitively from src/main/func_020a6a28.s: scans `a` byte by
 * byte for NUL-terminated pattern `b`, returns a pointer to the match).
 * Only byte 0 (0x23 = '#') is load-bearing; everything after the
 * NUL terminator is unread padding.
 * Consumer: src/overlay010/func_ov010_021b4144.c:13
 * (Ov010_BindGlyphTemplate: `p = func_020a6a28(arg0, data_ov010_021b8c14);
 * *p = <computed glyph byte>;`; relocs.txt from:0x021b4188 kind:load
 * to:0x021b8c14).
 * Same "one-char placeholder, found-then-stamped" idiom recurs in
 * src/overlay015/func_ov015_021b3528.c (data_ov015_021b5d30) and
 * src/overlay020/func_ov020_021aa67c.c (data_ov020_021ae03c) -- both
 * still uncarved siblings of this family. Plain char (matches the
 * existing consumer's own `extern char data_ov010_021b8c14[];`
 * declaration); kept non-const (.data ground truth).
 */

char data_ov010_021b8c14[12] = "#";
