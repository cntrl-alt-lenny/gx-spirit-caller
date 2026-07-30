/* data_ov004_0220a12c (32 bytes, 4-aligned): wave 14 string retype.
 * relocs.txt: from:0x021d878c kind:load to:0x0220a12c -- one real
 * consumer (func_ov004_021d8648 / Ov004_InitLockGate, permanent
 * GLOBAL_ASM). NOT part of the /Duel2D/MOBJ/ family despite proximity to
 * wave 13's shipped strings -- verified from bytes, not assumed: this is
 * a distinct "Common dialog" UI family, paired with sibling templates
 * data_ov004_0220a14c/_0220a16c. 28 printable ASCII + 4 trailing NUL,
 * byte-exact per script re-extraction. Plain char, no const/unsigned
 * (.data ground truth, delinks.txt).
 */

char data_ov004_0220a12c[32] = "/Common/dialog_unite01.LZ5bg";
