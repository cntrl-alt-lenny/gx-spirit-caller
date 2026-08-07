/* data_ov006_021cc40c (108 bytes, 4-aligned): RecordOv006_021cc588[9],
 * cm-restock-carve-1. Sibling of data_ov006_021cc3a0 -- same
 * func_ov006_021bd8ac.s switch, state 2 pairs already-typed
 * data_ov006_021cc478 with THIS table as idTable, `mov r6,#0x9` confirms
 * 9 records. See data_ov006_021cc3a0.c for the full field-provenance
 * writeup (identical struct, identical consumer, identical access
 * idiom). id sequence (field2) is identical to data_ov006_021cc3a0's own
 * (13,15,16,17,18,19,20,14,21) -- a clone-by-swap sibling pair, same
 * idiom as this campaign's other clone families. relocs.txt: literal-pool
 * loads at 0x021bdcb8-cc corroborate the full 3-pair table set. Kept
 * non-const, matching the symbol's own prior non-const declaration (.data
 * ground truth).
 */
typedef struct {
    short field0;
    short field1;
    int   field2;
    int   field3;
} RecordOv006_021cc588;

RecordOv006_021cc588 data_ov006_021cc40c[9] = {
    { 33, 30, 13, 3 },
    { 94, 30, 15, 7 },
    { 112, 30, 16, 8 },
    { 131, 30, 17, 9 },
    { 150, 30, 18, 10 },
    { 169, 30, 19, 11 },
    { 228, 30, 20, 12 },
    { 207, 30, 14, 13 },
    { 53, 30, 21, 4 },
};
