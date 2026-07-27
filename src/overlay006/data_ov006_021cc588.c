/* D-2 wave 2: scalar array (0x90 bytes)
 *
 * cm-data-inference-3: retyped from opaque bytes to a typed struct
 * array. Evidence: 3 real consumers (func_ov006_021ba364.s,
 * func_ov006_021bbe7c.s, func_ov006_021bd8ac.s) all compute
 * `base + idx*0xc` at runtime (linear search / `mla idx,#0xc,base`),
 * reading field0/field1 (offsets 0/2, ldrsh, forwarded to
 * func_020216b0 as UI param values) and field3 (offset 8, used as a
 * search key / cross-reference into sibling tables and a bounded
 * jump-table dispatch). Stride 0xc (12) independently corroborated by
 * two sibling tables sharing the identical consumer code with different,
 * size-matched loop bounds: data_ov006_021cc478 (132B = 11*12) and
 * data_ov006_021cc0f4 (36B = 3*12), both also retyped this item.
 *
 * Byte content is an exact reinterpretation of the same bytes previously
 * shipped as `unsigned char data_ov006_021cc588[144]` -- mechanically
 * parsed out of the previous literal and round-trip-verified, never
 * hand-transcribed.
 */
typedef struct {
    short field0;   /* offset 0x0 -- ldrsh; func_020216b0 param index 3 */
    short field1;    /* offset 0x2 -- ldrsh; func_020216b0 param index 4 */
    int field2;        /* offset 0x4 -- ldr; func_020216b0 param index 0xd */
    int field3;          /* offset 0x8 -- ldr; search key + jump-table dispatch value */
} RecordOv006_021cc588;

RecordOv006_021cc588 data_ov006_021cc588[12] = {
    { 15, 15, 0, 1 },
    { 45, 15, 1, 2 },
    { 72, 15, 2, 3 },
    { 93, 15, 3, 4 },
    { 115, 20, 4, 6 },
    { 134, 20, 5, 7 },
    { 152, 20, 5, 8 },
    { 171, 20, 6, 9 },
    { 190, 20, 6, 10 },
    { 209, 20, 6, 11 },
    { 228, 20, 6, 12 },
    { 246, 20, 7, 13 },
};
