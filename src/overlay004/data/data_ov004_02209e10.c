/* data_ov004_02209e10 (24 bytes, 4-aligned): wave 14 string retype.
 * relocs.txt: from:0x021d0e40 and from:0x021d3564 (both kind:load to
 * this address) -- two real consumers (func_ov004_021d06ac.s,
 * func_ov004_021d3390.s), each `ldr r0,=this; mov r1,#4; mov r2,#0;
 * bl func_02006c0c` -- the identical idiom both functions use for
 * this symbol's siblings (data_ov004_02209e28/_e44/_e60/_e70/_e88/_ea0),
 * a /WiFi/ background-asset path-string family. 23 printable ASCII +
 * 1 trailing NUL, byte-exact per script re-extraction. Plain char, no
 * const/unsigned (.data ground truth).
 */

char data_ov004_02209e10[24] = "/WiFi/bg_ue_musen.LZ5bg";
