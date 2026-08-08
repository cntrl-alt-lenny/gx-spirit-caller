/* data_020fe958 (32 bytes, 4-aligned): HTTP GET request-line + headers
 * format string: "GET /%s HTTP/1.0\r\nHost: %s\r\n\r\n", followed by 2
 * trailing NUL bytes (past the 1 a plain string literal would supply --
 * kept as a raw byte array, not a quoted literal, for exact byte fidelity).
 * Sibling of data_020fe904.c (POST variant); the two are byte-adjacent in
 * ROM (0x020fe904 + 84 == 0x020fe958) but remain separate linker symbols.
 * Consumer: func_020417e8 (main, 196B; not yet landed as matched C -- see
 * docs/research/dossiers/020417e8.md / docs/research/c-match-prep/020417e8.c,
 * ground truth lists `_LIT2: data_020fe958` in the real literal pool).
 * Selected as the `else` branch of the same sign-string select as
 * data_020fe904: `sign = data_020fe958;` when `*(int*)(self+0x1008) != 0`.
 * relocs.txt: `from:0x020418a8 kind:load to:0x020fe958 module:main`
 * (config/eur/arm9/relocs.txt:6629).
 * Not const: inside main's .data span (delinks.txt line 4). 4-aligned.
 */
unsigned char data_020fe958[32] = {
    0x47, 0x45, 0x54, 0x20, 0x2f, 0x25, 0x73, 0x20, 0x48, 0x54, 0x54, 0x50,
    0x2f, 0x31, 0x2e, 0x30, 0x0d, 0x0a, 0x48, 0x6f, 0x73, 0x74, 0x3a, 0x20,
    0x25, 0x73, 0x0d, 0x0a, 0x0d, 0x0a, 0x00, 0x00,
};
