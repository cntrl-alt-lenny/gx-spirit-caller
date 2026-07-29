/* data_ov004_0220a16c (32 bytes, 4-aligned): wave 14 string retype.
 * relocs.txt: from:0x021d8cb4 kind:load to:0x0220a16c -- func_ov004_021d8798
 * (same function as sibling data_ov004_0220a14c) loads this into r1 and
 * calls OS_SPrintf(sp+0x30, this, r7) immediately after the identical
 * call using 0220a14c as the format string -- back-to-back sprintf
 * calls, r7 bounded to 1/2 just before. "Common dialog" family (see
 * 0220a12c/0220a14c), not wave 13's /Duel2D/MOBJ/ family despite
 * proximity to 0220a20c. 30 printable ASCII + 2 trailing NUL, byte-exact
 * per script re-extraction. Plain char, no const/unsigned (.data).
 */

char data_ov004_0220a16c[32] = "/Common/dialog_unite%02d.LZ5bg";
