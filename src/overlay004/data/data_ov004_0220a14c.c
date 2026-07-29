/* data_ov004_0220a14c (32 bytes, 4-aligned): wave 14 string retype.
 * relocs.txt: from:0x021d8cb0 kind:load to:0x0220a14c -- consumer
 * func_ov004_021d8798 (GLOBAL_ASM, size 0x538) loads this into r1 and
 * calls OS_SPrintf(dest, this, r7) -- an sprintf template, not a
 * compile-time escape. Sibling data_ov004_0220a16c used identically
 * 4 instructions later in the same function ("Common dialog" family,
 * distinct from wave 13's /Duel2D/MOBJ/ family despite proximity to
 * 0220a20c). 29 printable ASCII + 3 trailing NUL, byte-exact per script
 * re-extraction. Plain char, no const/unsigned (.data ground truth).
 */

char data_ov004_0220a14c[32] = "/Common/dialog_base%02d.LZ5bg";
