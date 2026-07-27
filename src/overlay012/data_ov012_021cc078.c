/* data_ov012_021cc078 (4 bytes, 4-aligned): NEW carve as part of
 * cm-data-inference-7, filling a previously-unclaimed delinks.txt gap
 * between sibling data_ov012_021cc06c and data_ov012_021cc07c -- part
 * of the same real 56-byte object, see data_ov012_021cc06c.c.
 *
 * STRONG: func_ov012_021ca964.s:271,273 reads both halfwords (single
 * live loop iteration, `cmp r8,#1`) and forwards them as args to
 * func_ov000_021ac478.s, which Fill32-zeroes a 20-byte destination
 * record then bit-packs both values (masked, non-pointer small
 * quantities) into subfields.
 */

const unsigned short data_ov012_021cc078[2] = { 216, 168 };
