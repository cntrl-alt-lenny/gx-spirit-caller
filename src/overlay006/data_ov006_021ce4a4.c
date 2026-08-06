/* data_ov006_021ce4a4 (60 bytes, 4-aligned): short[30] point-value table,
 * cm-restock-carve-1. Sole consumer func_ov006_021c82ac.s (ship-as-.s):
 * `ldr r0,_LIT9; mov r1,r6,lsl#1; ldrsh r6,[r0,r1]` -- halfword-stride
 * (lsl#1) access indexed by a flat row*width+col cell index (mla), i.e. a
 * plain short array, NOT a pointer/struct table (relocs.txt: zero
 * embedded pointers in range -- this rules out grouping with the
 * same-size Ov006AudioBank family, whose members are always accessed via
 * fixed-offset fields, never a computed stride). The looked-up value
 * feeds a base-10 digit-extraction loop immediately after (mul-by-
 * reciprocal 0x66666667, the classic /10 trick) -- this table supplies a
 * decimal score/point total rendered per board cell. Values decode as a
 * clean 5-row x 6-col grid (row starts 5000/4500/4000/3500/3000, most
 * columns step -100 per row, final column mostly 0 with one -1).
 * relocs.txt: single load reloc matching the consumer's own literal pool
 * (_LIT9). Kept non-const, matching the symbol's own prior non-const
 * .data declaration.
 */
short data_ov006_021ce4a4[30] = {
    5000, 2900, 2400, 1900, 1400,  500,
    4500, 2800, 2300, 1800, 1300,    0,
    4000, 2700, 2200, 1700, 1200,   -1,
    3500, 2600, 2100, 1600, 1100,    0,
    3000, 2500, 2000, 1500, 1000,    0,
};
