/* data_ov004_02209f88 (12 bytes, 4-aligned): wave 14 string retype.
 * relocs.txt: from:0x021d3e8c and from:0x021d4fd8 (both kind:load to
 * this address) -- two real consumers. func_ov004_021d3de4.s calls
 * func_02051ab0(ctx, this, 1) (keyed lookup). func_ov004_021d4e0c.s
 * uses this as the 3rd of 5 back-to-back identical-shape
 * func_02033d3c(&amp;struct_field, key_string, value) calls, struct fields
 * spaced 0x28 bytes apart -- a named struct-field/config-key list
 * (sibling keys data_ov004_0220a010/_01c/_028/_034, still opaque). 10
 * printable ASCII + 2 trailing NUL, byte-exact per script re-extraction.
 * Plain char, no const/unsigned (.data ground truth).
 */

char data_ov004_02209f88[12] = "game_level";
