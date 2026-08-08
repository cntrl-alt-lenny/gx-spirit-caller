/* data_ov006_021cdddc (16 bytes, 4-aligned): short[8] glyph-ID lookup,
 * cm-restock-carve-1. Sole consumer func_ov006_021c480c.c:15,26-27
 * (`extern short data_ov006_021cdddc[]; ... short tval =
 * data_ov006_021cdddc[idx];`), idx = self->f60*4 + 1 + self->f5c, proven
 * to range 0..7 exactly for self->f60 in {0,1} and self->f5c in {-1..2} --
 * no OOB. tval feeds func_0202c0c0 ("glyph_id -> sprite",
 * ov006_core.h:305). relocs.txt: single load reloc matching the
 * consumer's own literal pool. -1 = no label. Kept non-const, matching
 * the symbol's own prior non-const declaration (.data ground truth).
 */
short data_ov006_021cdddc[8] = { -1, 1098, 1099, 1101, 1100, 1102, 1103, 1105 };
