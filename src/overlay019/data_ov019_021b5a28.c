/* data_ov019_021b5a28 (40 bytes, 4-aligned): retyped from opaque bytes to
 * a struct{short f0,f1,f2,f3}[5] record table as part of cm-data-inference-8.
 * Byte-identical to sibling data_ov016_021b8e34 -- likely a shared duel-
 * field-layout table reused verbatim across overlays. Sole consumer
 * func_ov019_021b4258.s: Loop A bulk-copies all 40 bytes to a stack buffer
 * (`mov r2,#0xa`, 4B/iter); Loop B re-reads the copy at STRIDE=8 with a
 * genuine loop-carried index (`cmp lr,#0x5`), proving 5 records of 4
 * fields. Field periodicity (f0 const=232, f2 const=256 across all 5 rows)
 * independently corroborates the 8-byte grouping.
 */

typedef struct {
    short f0;
    short f1;
    short f2;
    short f3;
} Row021b5a28;

const Row021b5a28 data_ov019_021b5a28[5] = {
    { 232, 28,  256, 136 },
    { 232, 8,   256, 28 },
    { 232, 131, 256, 151 },
    { 232, 29,  256, 48 },
    { 232, 111, 256, 131 },
};
