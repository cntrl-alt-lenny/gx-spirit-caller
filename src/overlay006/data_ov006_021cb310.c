/* data_ov006_021cb310 (28 bytes, 4-aligned): retyped from opaque bytes to
 * a signed int[7] array as part of cm-data-inference-6. Byte-identical
 * to sibling data_ov006_021cb2d8 -- a separate table for a separate
 * caller family, not a duplicate symbol.
 *
 * Computed-stride consumers (both walled .s, no C match yet):
 * func_ov006_021b8544.s (_LIT2, `ldreq r1,_LIT2; ldreq r6,[r1,r0,lsl#2]`)
 * and func_ov006_021b9a00.s (_LIT7, `ldrne r1,_LIT7; ldrne r0,[r1,r0,
 * lsl#2]`), both indexing by a runtime func_0202b8c0() return value.
 */

const int data_ov006_021cb310[7] = { 5, -1, 3, 1, 4, 0, 2 };
