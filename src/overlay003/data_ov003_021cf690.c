/* data_ov003_021cf690 (48 bytes, 4-aligned): OS_SPrintf format-string
 * literal for a "Bustup" (character-portrait) palette resource path.
 * Consumer: func_ov003_021ccea4 (src/overlay003/func_ov003_021ccea4.s,
 * "Ov003_PushColourStreams" per docs/research/retriage/
 * SmallOverlaysRetriageR8.md:855-874, part of a 27-descriptor pool this
 * function also walks -- this specific slot is the 28th/final pool word,
 * NOT one of the 27 stream descriptors), block .L_2e90 (_LIT30, line
 * 351): `ldr r1,_LIT30; mov r2,#0x37; bl OS_SPrintf` i.e.
 * OS_SPrintf(buf, data_ov003_021cf690, 0x37) (relocs.txt ov003:501
 * from:0x021cd354 kind:load to:0x021cf690).
 * Decodes to "/Bustup/bu%03d_e.LZNCLR" (23 printable ASCII chars + NUL =
 * 24 bytes); the remaining 24 bytes are zero and not separately
 * referenced by any reloc in 0x021cf6a8..0x021cf6bf -- left as the
 * array's implicit zero-fill tail (C aggregate-init rule), matching
 * ground truth exactly, not hand-padded. Plain `char[N] = "..."` string
 * literal follows the established convention for pure-ASCII resource-path
 * format strings in this project (see src/overlay004/data/
 * data_ov004_0220a250.c: `char data_ov004_0220a250[32] =
 * "/Duel2D/MOBJ/edit_%03dn.LZ5bg";` and data_ov004_02209aec.c) --
 * distinct from the Shift-JIS byte-array exception (data_020c5934.c),
 * which doesn't apply here since this string is pure ASCII.
 * Not const: original section is .data (delinks.txt ov003 line 5:
 * .data start:0x021cf160 end:0x021cf6c0).
 */
char data_ov003_021cf690[48] = "/Bustup/bu%03d_e.LZNCLR";
