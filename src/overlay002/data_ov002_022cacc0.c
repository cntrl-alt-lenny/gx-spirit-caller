/* data_ov002_022cacc0 (116 bytes, 4-aligned): retyped from opaque bytes
 * to a 3-field bitfield struct array[29] as part of cm-data-inference-7.
 *
 * STRONG: `id:13` proven by 2 already-shipped, matched C consumers
 * (func_ov002_022476e8.c, func_ov002_02247ad8.c -- both a sentinel-
 * terminated `struct Ov002Item { unsigned int id:13; } *p = base; while
 * (p->id) {...} p++;` pointer walk, data-driven loop bound, not a fixed
 * count). `idHigh:13` (bits 13-25) and `field3:6` (bits 26-31) each
 * independently proven by shipped byte-verbatim `.s` (func_ov002_02246e5c.s,
 * func_ov002_022477e8.s, func_ov002_02246ecc.s, func_ov002_022470c4.s --
 * "the original disassembly emitted verbatim", as authoritative as
 * compiled C), all indexing `data_ov002_022cacc0[<runtime param>]`
 * (computed-stride, never a compile-time constant). The 3 fields tile
 * all 32 bits exactly, and the record count (29 = 28 real + 1
 * all-zero sentinel/terminator) matches every consumer's own
 * termination convention. relocs.txt confirms zero embedded pointers.
 * Kept non-`const`/non-`static`, matching the original declaration
 * exactly (see data_ov006_021ce5c4.c for why this matters on this
 * toolchain).
 */

typedef struct {
    unsigned int id : 13;      /* bits [12:0] */
    unsigned int idHigh : 13;  /* bits [25:13] */
    unsigned int field3 : 6;   /* bits [31:26] */
} Ov002Item;

Ov002Item data_ov002_022cacc0[29] = {
    { 4362, 4679, 7 },
    { 4366, 4677, 8 },
    { 4370, 4676, 8 },
    { 4371, 4680, 6 },
    { 4707, 4682, 6 },
    { 4708, 4683, 6 },
    { 4710, 4685, 7 },
    { 4715, 4700, 7 },
    { 4716, 4698, 8 },
    { 4722, 4703, 7 },
    { 4723, 4702, 8 },
    { 4724, 4706, 7 },
    { 4725, 4705, 6 },
    { 4728, 4727, 8 },
    { 4737, 4802, 1 },
    { 5094, 5103, 8 },
    { 5175, 5176, 8 },
    { 5185, 5186, 6 },
    { 5600, 5601, 4 },
    { 5697, 5721, 8 },
    { 5781, 5783, 7 },
    { 5782, 5785, 8 },
    { 6342, 6351, 8 },
    { 6343, 6350, 3 },
    { 6612, 6617, 8 },
    { 6613, 6617, 8 },
    { 6991, 6997, 6 },
    { 6992, 6998, 6 },
    { 0, 0, 0 },
};
