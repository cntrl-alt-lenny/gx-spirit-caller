/* data_ov004_02209d10 (32 bytes, 4-aligned): wave 14 string retype.
 * relocs.txt: from:0x021ce1ac kind:load to:0x02209d10 -- consumer
 * func_ov004_021cded0.s (_LIT13) passes this directly as OS_SPrintf's
 * format-string argument, with a computed int (from a bitfield mla) as
 * the %03d value; the primary format string in 3 of the function's 4
 * branches (siblings data_ov004_02209d30/_d4c cover the other two).
 * Byte-identical to wave 13's shipped data_ov004_0220a250 and sibling
 * data_ov004_02209cc8. 29 printable ASCII + 3 trailing NUL, byte-exact
 * per script re-extraction. Plain char, no const/unsigned (.data
 * ground truth).
 */

char data_ov004_02209d10[32] = "/Duel2D/MOBJ/edit_%03dn.LZ5bg";
