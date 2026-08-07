/* data_ov006_021cc3a0 (108 bytes, 4-aligned): RecordOv006_021cc588[9],
 * cm-restock-carve-1. Reuses the already-shipped RecordOv006_021cc588
 * typedef (data_ov006_021cc588.c) verbatim. Consumer func_ov006_021bd8ac.s
 * (ship-as-.s, Ov006_Battle_Resolve per docs/research/retriage/
 * Ov004Ov006DeepR8.md:2514-2555): 3-way switch on self->f40 picks one of
 * 3 (indexTable,idTable) pairs; state 0/3 pairs already-typed
 * data_ov006_021cc588 with THIS table as idTable, `mov r6,#0x9` confirms
 * 9 records. Field layout confirmed by the linear-search body: ldr@+0x8
 * (search key) in the loop, then ldr@+0x4 + ldrsh@+0x0/+0x2 of the
 * matched record -- byte-for-byte the same access pattern as the
 * already-shipped sibling. relocs.txt: literal-pool loads at
 * 0x021bdcb8-cc corroborate the full 3-pair table set. Kept non-const,
 * matching the symbol's own prior non-const declaration (.data ground
 * truth).
 */
typedef struct {
    short field0;
    short field1;
    int   field2;
    int   field3;
} RecordOv006_021cc588;

RecordOv006_021cc588 data_ov006_021cc3a0[9] = {
    { 64, 30, 13, 3 },
    { 125, 30, 15, 7 },
    { 143, 30, 16, 8 },
    { 162, 30, 17, 9 },
    { 181, 30, 18, 10 },
    { 200, 30, 19, 11 },
    { 219, 30, 20, 12 },
    { 238, 30, 14, 13 },
    { 84, 30, 21, 4 },
};
