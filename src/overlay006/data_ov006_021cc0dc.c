/* data_ov006_021cc0dc (24 bytes, 4-aligned): RecordOv006_021cc588[2],
 * cm-restock-carve-1. Reuses the already-shipped RecordOv006_021cc588
 * typedef (data_ov006_021cc588.c) verbatim -- this is the missing
 * "secondary" table for the self->f40==else case in
 * func_ov006_021bd8ac.s, paired with the already-typed primary
 * data_ov006_021cc0f4[3] (secondary siblings data_ov006_021cc3a0/_40c
 * remain unresolved placeholders, out of scope here). Consumer:
 * `ldr r3,_LIT4` (primary, data_ov006_021cc0f4) `+ ldr r0,_LIT5`
 * (secondary, this symbol), `mov r3,#0x2` loop bound matching this
 * symbol's 24B/12B-stride = 2 records exactly; linear-searches this
 * table's field3 against the primary record's own field3 as a search
 * key. relocs.txt: single load reloc (_LIT5) matching the consumer's own
 * literal pool, no internal pointer relocations. Kept non-const, matching
 * the symbol's own prior non-const declaration (.data ground truth).
 */
typedef struct {
    short field0;   /* offset 0x0 */
    short field1;   /* offset 0x2 */
    int   field2;   /* offset 0x4 */
    int   field3;   /* offset 0x8 -- search key, compared against primary-table field3 */
} RecordOv006_021cc588;

RecordOv006_021cc588 data_ov006_021cc0dc[2] = {
    { 33, 30, 13, 3 },
    { 53, 30, 21, 4 },
};
