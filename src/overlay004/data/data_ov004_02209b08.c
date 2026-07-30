/* data_ov004_02209b08 (28 bytes, 4-aligned): wave 14 string retype.
 * relocs.txt: from:0x021caaf8 kind:load to:0x02209b08 -- consumer
 * func_ov004_021ca4f8.s conditionally loads this vs. sibling
 * data_ov004_02209aec ("WL_Icons" vs "WF_Icons") on a runtime flag, then
 * calls func_02006c0c(path,4,0) -- the A/B alternative of that pair.
 * 27 printable ASCII + 1 trailing NUL, byte-exact per script
 * re-extraction. Plain char, no const/unsigned (.data ground truth).
 */

char data_ov004_02209b08[28] = "/Duel2D/MOBJ/WL_Icons.LZ5bg";
