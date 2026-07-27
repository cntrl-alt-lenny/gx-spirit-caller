/* data_ov006_021cc03c (20 bytes, 4-aligned): retyped from opaque bytes to
 * a {short,short}[5] screen-position table as part of cm-data-inference-9.
 * One of a 4-member sibling family (data_ov006_021cc050/_021cc064/
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

Ov006PosRow021cc03c data_ov006_021cc03c[5] = {
    { 40, 175 },
    { 96, 175 },
    { 146, 175 },
    { 196, 175 },
    { 0, 0 },
};
