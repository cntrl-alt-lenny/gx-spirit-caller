/* data_ov011_021d3594 (24 bytes, 4-aligned): retyped from opaque bytes to
 * a { s8 code, s8 sub, s16 x, s16 y } record[4] as part of cm-data-inference-6.
 *
 * Sole consumer func_ov011_021d191c.s:28,31-33,43,48-49 (walled .s, no C
 * match): `ldr r2,_LIT1; mla r4,r1,r0,r2` with r0=#6 -- a genuine
 * computed-stride base+idx*6 access (runtime idx = row-0x7d) -- then
 * `ldrsh r0,[r4,#2]` / `ldrsh r1,[r4,#4]` (x, y fields) and
 * `ldrsb r6,[r4,#1]` (sub field), matching the 6-byte record exactly.
 */

typedef struct {
    signed char code;
    signed char sub;
    short x;
    short y;
} Entry021d3594;

const Entry021d3594 data_ov011_021d3594[4] = {
    { 3, 3, 269, 190 },
    { 1, 4, 135, 295 },
    { 2, 7, 76, 317 },
    { 4, 4, 210, 423 },
};
