/* data_ov006_021cb634 (40 bytes, 4-aligned): retyped from opaque bytes to
 * a signed short[5][4] record table as part of cm-data-inference-6.
 *
 * Sole consumer func_ov006_021be6f4.s (walled .s, no C match): bulk-copies
 * this table plus sibling data_ov006_021cb65c into a stack buffer via an
 * explicit `mov r2,#0xa` (10) -bounded 4-byte-per-iteration loop (_LIT1,
 * lines 24-36), then reads the copy back as 5 records of 4 halfwords each
 * (`mov r1,r0,lsl#3; ldrsh r2,[ip,r1]; ldrsh r1,[r3,#2/4/6]`, `cmp r0,#5`
 * loop bound at .L_1e8/.L_248) -- both the record count and field width
 * are loop-bound-proven, and the final reads are ldrsh (signed).
 */

typedef struct {
    short f0;
    short f1;
    short f2;
    short f3;
} Row021cb634;

const Row021cb634 data_ov006_021cb634[5] = {
    { 233, 56, 252, 145 },
    { 233, 39, 252, 55 },
    { 233, 146, 252, 162 },
    { 233, 56, 252, 74 },
    { 233, 127, 252, 145 },
};
