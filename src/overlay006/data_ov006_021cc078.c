/* data_ov006_021cc078 (20 bytes, 4-aligned): retyped from opaque bytes to
 * a {short,short}[5] screen-position table as part of cm-data-inference-9.
 * One of a 4-member sibling family (data_ov006_021cc03c/_021cc050/
 * _021cc064 are the other 3, same shape/size, shipped alongside this
 * file) selected by a runtime `self->f40` 7-way dispatch in 2 independent
 * consumers: func_ov006_021bcedc.s (index×4 into the table, index proven
 * ∈[0,4] by a `cmp r9,#0x5`-bounded classification loop) and
 * func_ov006_021be948.s (pointer-incremented by 4 each of exactly 5
 * loop-bound-proven iterations, `cmp r5,#0x5`). Both read offsets 0x0/0x2
 * as signed halfwords (ldrsh) -- an (X,Y) screen-position pair. Kept
 * non-const, matching the symbol's own prior non-const declaration
 * (.data ground truth per delinks.txt).
 */

typedef struct {
    short x;
    short y;
} Ov006PosRow021cc03c;

Ov006PosRow021cc03c data_ov006_021cc078[5] = {
    { 0, 0 },
    { 44, 175 },
    { 114, 175 },
    { 184, 175 },
    { 0, 0 },
};
