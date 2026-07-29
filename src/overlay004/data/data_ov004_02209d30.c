/* data_ov004_02209d30 (28 bytes, 4-aligned): wave 14 string retype.
 * relocs.txt: from:0x021ce1b0 kind:load to:0x02209d30 -- consumer
 * func_ov004_021cded0.s (_LIT14); docs/research/retriage/
 * Ov004Ov006DeepR8.md's independent reverse-engineering shows this as
 * the "slot==0" category label, passed to func_02006b10(label) and
 * func_02006c0c(label,4,0). Sibling of data_ov004_02209d10 ("edit_%03dn"
 * template used in the same function) and data_ov004_02209d4c (next
 * category label). Independently verified byte-identical to
 * data_ov004_02209c70 (same "chr_NTj.LZ5bg" string, different unrelated
 * call site -- a genuine duplicate). 26 printable ASCII + 2 trailing
 * NUL, byte-exact per script re-extraction. Plain char, no
 * const/unsigned (.data ground truth).
 */

char data_ov004_02209d30[28] = "/Duel2D/MOBJ/chr_NTj.LZ5bg";
