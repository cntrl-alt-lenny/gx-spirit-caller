/* data_020beedc -- [hl][wl][2] lookup table (32 bytes, 4-aligned).
 *
 * 3 independent consumers (func_02080280.s, func_02080728.s,
 * func_02081498.s) all compute base + hl*8 + wl*2 (two separate ldrb
 * loads, never ldrh -- byte order is load-bearing, keep as
 * unsigned char[2] not unsigned short), where hl/wl are each derived by
 * an identical `cmp #0x8 / movge ,#0x3 / clzlt / rsblt` capped-log2 idiom
 * applied to 2 runtime size arguments -- mathematically bounded to
 * {0,1,2,3} in all 3 functions independently. 4*4*2=32 bytes, exact fit,
 * no slack. relocs.txt confirms exactly 3 loads (one per consumer), zero
 * embedded pointers. See docs/research/data/cm-data-inference-4-2026-07-25.md.
 */

const unsigned char data_020beedc[4][4][2] = {
    { {0x00,0x00}, {0x01,0x00}, {0x02,0x00}, {0x02,0x00} },
    { {0x00,0x01}, {0x01,0x01}, {0x02,0x01}, {0x02,0x01} },
    { {0x00,0x02}, {0x01,0x02}, {0x02,0x02}, {0x03,0x02} },
    { {0x00,0x02}, {0x01,0x02}, {0x02,0x03}, {0x03,0x03} },
};
