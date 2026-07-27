/* data_ov006_021cc064 (20 bytes, 4-aligned): retyped from opaque bytes to
 * a {short,short}[5] screen-position table as part of cm-data-inference-9.
 * One of a 4-member sibling family (data_ov006_021cc03c/_021cc050/
 * _021cc078 are the other 3, same shape/size, shipped alongside this
 * file) -- see data_ov006_021cc078.c for the full evidence (both
 * consumers, func_ov006_021bcedc.s and func_ov006_021be948.s, select
 * among all 4 siblings via the same `self->f40` dispatch and the same
 * loop-bound-proven 5-element/4-byte-stride access). Kept non-const,
 * matching the symbol's own prior non-const declaration (.data ground
 * truth per delinks.txt).
 */

typedef struct {
    short x;
    short y;
} Ov006PosRow021cc03c;

Ov006PosRow021cc03c data_ov006_021cc064[5] = {
    { 62, 175 },
    { 168, 175 },
    { 0, 0 },
    { 0, 0 },
    { 0, 0 },
};
