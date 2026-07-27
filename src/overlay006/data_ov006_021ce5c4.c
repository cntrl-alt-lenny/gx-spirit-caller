/* data_ov006_021ce5c4 (140 bytes, 4-aligned): retyped from opaque bytes
 * to a { short key, val; } array[35] as part of cm-data-inference-7.
 *
 * STRONG: 2 walled .s consumers (func_ov006_021c7f5c.s and
 * func_ov006_021c8068.s, twin forward/reverse lookups) share the
 * identical `base + i*4` computed-stride loop, bounded by a hardcoded
 * per-case immediate `mov ip,#0x23`=35 (not inferred from byte size --
 * an independent proof). relocs.txt confirms zero embedded pointers.
 * Values decode as keys 0-33 ascending, a permuted val column, and a
 * {-1,0} sentinel terminator. Kept non-`const`/non-`static`, matching
 * the original declaration exactly (this codebase's mwcc: `static
 * const` here would relocate the array into `.rodata`, breaking the
 * link against the ground-truth `.data` placement).
 */

typedef struct {
    short key;
    short val;
} kv_t;

kv_t data_ov006_021ce5c4[35] = {
    { 0, 30 },  { 1, 29 },  { 2, 20 },  { 3, 33 },  { 4, 16 },
    { 5, 21 },  { 6, 22 },  { 7, 27 },  { 8, 14 },  { 9, 15 },
    { 10, 3 },  { 11, 2 },  { 12, 5 },  { 13, 4 },  { 14, 1 },
    { 15, 19 }, { 16, 28 }, { 17, 25 }, { 18, 26 }, { 19, 23 },
    { 20, 24 }, { 21, 34 }, { 22, 13 }, { 23, 7 },  { 24, 8 },
    { 25, 9 },  { 26, 6 },  { 27, 12 }, { 28, 10 }, { 29, 11 },
    { 30, 31 }, { 31, 32 }, { 32, 17 }, { 33, 18 }, { -1, 0 },
};
