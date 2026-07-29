/* data_ov004_02209aec (28 bytes, 4-aligned): wave 14 string retype.
 * relocs.txt: from:0x021caaf4 kind:load to:0x02209aec -- EUR consumer
 * func_ov004_021ca4f8.s conditionally loads this vs. sibling
 * data_ov004_02209b08 ("WF_Icons" vs "WL_Icons") on a runtime flag, then
 * calls func_02006c0c(path,4,0). USA/JPN's func_ov004_021cddf0.s use it
 * directly as an OS_SPrintf format-string argument -- two independent
 * confirmations of string usage. 27 printable ASCII + 1 trailing NUL,
 * byte-exact per script re-extraction. Plain char, no const/unsigned
 * (.data ground truth).
 */

char data_ov004_02209aec[28] = "/Duel2D/MOBJ/WF_Icons.LZ5bg";
