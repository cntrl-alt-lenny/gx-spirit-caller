/* data_ov006_021ce56c (88 bytes, 4-aligned): retyped from opaque bytes
 * to a { short key, val; } array[22] as part of cm-data-inference-7.
 *
 * STRONG: 2 walled .s consumers (func_ov006_021c7f5c.s and
 * func_ov006_021c8068.s -- the same twin forward/reverse-lookup pair
 * that also consumes sibling data_ov006_021ce5c4) share the identical
 * `base + i*4` computed-stride loop, bounded by a hardcoded per-case
 * immediate `mov ip,#0x16`=22 (not inferred from byte size -- an
 * independent proof, and distinct from the sibling's own 0x23=35
 * bound, ruling out the two tables being confused with each other).
 * relocs.txt confirms zero embedded pointers. Values decode as keys
 * 1-21 ascending, a permuted val column, and a {-1,0} sentinel
 * terminator. Kept non-`const`/non-`static`, matching the original
 * declaration exactly (see data_ov006_021ce5c4.c for why).
 */

typedef struct {
    short key;
    short val;
} kv_t;

kv_t data_ov006_021ce56c[22] = {
    { 1, 11 },  { 2, 8 },   { 3, 4 },   { 4, 5 },   { 5, 14 },
    { 6, 7 },   { 7, 9 },   { 8, 18 },  { 9, 10 },  { 10, 12 },
    { 11, 15 }, { 12, 16 }, { 13, 17 }, { 14, 6 },  { 15, 1 },
    { 16, 13 }, { 17, 3 },  { 18, 2 },  { 19, 20 }, { 20, 19 },
    { 21, 21 }, { -1, 0 },
};
