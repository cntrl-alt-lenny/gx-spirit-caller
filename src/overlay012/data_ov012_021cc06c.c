/* data_ov012_021cc06c (12 bytes, 4-aligned): retyped from opaque bytes as
 * part of cm-data-inference-7. First 2 bytes STRONG (fixed-offset reads,
 * func_ov012_021ca964.s:281-286 -> func_ov000_021ac508.c:2-6, single live
 * loop iteration `cmp r8,#1`); remaining 10 bytes unevidenced -- no
 * consumer anywhere in src/ touches them, kept as an opaque tail rather
 * than guessing a shape. Formerly part of a wrongly-scoped mechanical
 * "Cluster C Pattern 1" 4-byte-multiple carve that also mis-sized sibling
 * data_ov012_021cc080 and left data_ov012_021cc078/021cc07c as unclaimed
 * gaps -- see those files for the rest of this real 56-byte object
 * (func_ov012_021ca18c.s independently proves the object extends at
 * least to +0x2a, past this file's own 12 bytes, confirming the four
 * legacy symbols are one contiguous object even though each keeps its
 * own natural sub-range here, per this project's own same-TU-ordering
 * caution in docs/research/data-carve-tu-alignment.md).
 */

typedef struct {
    unsigned char field0; /* = 6 */
    unsigned char field1; /* = 0xff */
    unsigned char unk[10];
} Ov012Entry021cc06c;

const Ov012Entry021cc06c data_ov012_021cc06c = {
    .field0 = 6,
    .field1 = 0xff,
    .unk = { 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00 },
};
