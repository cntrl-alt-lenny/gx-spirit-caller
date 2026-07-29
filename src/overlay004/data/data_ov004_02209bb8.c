/* data_ov004_02209bb8 (28 bytes, 4-aligned): wave 14 string retype.
 * relocs.txt: from:0x021cab1c kind:load to:0x02209bb8 -- consumer
 * func_ov004_021ca4f8.s loads this address and passes it as a filename
 * argument (r0) to func_02006c0c, one of 7 sibling asset-path-string
 * loads in the same function (a 4-string/3-string conditional pair);
 * this is the 3rd of the 3-string branch, alongside
 * data_ov004_02209b84/_02209b9c. Sibling of data_ov004_02209b9c
 * ("/WiFi/anime_musen1.LZ5bg", index 1). 24 printable ASCII + 4 trailing
 * NUL, byte-exact per script re-extraction. Plain char, no const/unsigned
 * (.data ground truth).
 */

char data_ov004_02209bb8[28] = "/WiFi/anime_musen2.LZ5bg";
