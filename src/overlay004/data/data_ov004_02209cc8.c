/* data_ov004_02209cc8 (32 bytes, 4-aligned): wave 14 string retype.
 * relocs.txt: from:0x021cd3a8 (func_ov004_021cced8's literal pool) and
 * from:0x021cd6b4 (func_ov004_021cd3b4), both kind:load to:0x02209cc8
 * -- two consumers, one with a structurally-verified C draft
 * (docs/research/data/func_ov004_021cd3b4-v5-draft.c, not yet wired
 * into the build) calling OS_SPrintf(text, this,
 * (((raw&amp;0x3e0)&gt;&gt;5)-1)*10+(raw&amp;0x1f)) -- the string's own %03d
 * fed a computed int. Byte-identical to wave 13's shipped
 * data_ov004_0220a250 and to sibling data_ov004_02209d10 (same MOBJ
 * template, third known copy). 29 printable ASCII + 3 trailing NUL,
 * byte-exact per script re-extraction. Plain char, no const/unsigned
 * (.data ground truth).
 */

char data_ov004_02209cc8[32] = "/Duel2D/MOBJ/edit_%03dn.LZ5bg";
