/* data_ov002_022c86b8 (744 bytes, 4-aligned): retyped from opaque bytes to
 * a typed struct array as part of cm-data-inference-3. One of 8
 * near-identical "card-ID -> handler-pointer pair" tables in this overlay
 * (data_ov002_022c89a0, _022c8ff0, _022c9010, _022c9038, _022c9250,
 * _022c9508, _022c9ad0 are the other 7; cm-data-inference-2 shipped 3 of
 * those, this item ships 3 more -- _022c8ff0/_022c9010 remain).
 *
 * The Ov002CardHandlerRecord type declared below matches the one already
 * shipped in data_ov002_022c9ad0.c/data_ov002_022c89a0.c verbatim (same
 * generic consumer, func_ov002_0228bcd0.s, handles all these tables
 * identically) -- one semantic record shape, independently redeclared per
 * TU per this codebase's existing convention (no shared header).
 *
 * Evidence: direct unmatched .s consumer func_ov002_0228c330.s walks the
 * table with a runtime pointer accumulator, `add r7,r7,#0x8` per
 * iteration (stride 8), loop bound `cmp r6,#0x5d` = 93 records exactly
 * (744/8) -- plus the shared record consumer func_ov002_0228bcd0.s, which
 * reads offset 0 as a plain word (id) and `ldr r2,[r2,#0x4]; blx r2` at
 * offset 4 (handler, invoked directly). relocs.txt independently confirms
 * a code-pointer relocation at every one of the 93 offset-4 words, all
 * 93/93 resolving to real function-symbol starts in symbols.txt.
 *
 * Pointer field emitted as a raw (void *)0x... literal-address cast (same
 * reasoning as every other table in this family: preserves the
 * already-shipping relocation-free representation). Byte content is an
 * exact reinterpretation of the same bytes previously shipped as
 * `const unsigned char data_ov002_022c86b8[744]` -- mechanically parsed
 * out of the previous literal and round-trip-verified, never
 * hand-transcribed.
 */
typedef struct {
    unsigned int cardId;  /* offset 0x0 */
    void *handler;         /* offset 0x4 */
} Ov002CardHandlerRecord;

const Ov002CardHandlerRecord data_ov002_022c86b8[93] = {
    { 0x17c2, (void *)0x0228a888 },
    { 0x17d4, (void *)0x0228a888 },
    { 0x17c6, (void *)0x0228a888 },
    { 0x12f5, (void *)0x0229110c },
    { 0x12f7, (void *)0x0229110c },
    { 0x12f6, (void *)0x0229110c },
    { 0x131c, (void *)0x0229110c },
    { 0x1258, (void *)0x0229110c },
    { 0x16db, (void *)0x0229110c },
    { 0x158a, (void *)0x0229110c },
    { 0x1774, (void *)0x0229110c },
    { 0x197a, (void *)0x0228a8b8 },
    { 0x14b6, (void *)0x0228a888 },
    { 0x14c7, (void *)0x0228a888 },
    { 0x132d, (void *)0x0228b684 },
    { 0x137c, (void *)0x0228b684 },
    { 0x1379, (void *)0x0228a6e0 },
    { 0x1515, (void *)0x0228a7c8 },
    { 0x162a, (void *)0x0228a974 },
    { 0x1960, (void *)0x0228a974 },
    { 0x148f, (void *)0x0228a974 },
    { 0x153e, (void *)0x0228a974 },
    { 0x1721, (void *)0x0228a974 },
    { 0x176b, (void *)0x0228a974 },
    { 0x18dd, (void *)0x0228a974 },
    { 0x18de, (void *)0x0228a974 },
    { 0x134f, (void *)0x0228a974 },
    { 0x1541, (void *)0x0228a974 },
    { 0x15a7, (void *)0x0229110c },
    { 0x156e, (void *)0x0229110c },
    { 0x15ab, (void *)0x0228a974 },
    { 0x198f, (void *)0x0228a974 },
    { 0x1360, (void *)0x0228ab68 },
    { 0x1302, (void *)0x0228aba0 },
    { 0x148c, (void *)0x0228a974 },
    { 0x183a, (void *)0x0228a974 },
    { 0x1470, (void *)0x0228a974 },
    { 0x15fc, (void *)0x0228a9a4 },
    { 0x1936, (void *)0x0228a9a4 },
    { 0x140d, (void *)0x0228a974 },
    { 0x12fe, (void *)0x0228a9a4 },
    { 0x12ff, (void *)0x0228a9a4 },
    { 0x16a6, (void *)0x0228a974 },
    { 0x16dd, (void *)0x0228a974 },
    { 0x15f1, (void *)0x0228a9a4 },
    { 0x14de, (void *)0x0228ab3c },
    { 0x1a24, (void *)0x0228a9a4 },
    { 0x1a25, (void *)0x0228a9a4 },
    { 0x162b, (void *)0x0228a9a4 },
    { 0x1849, (void *)0x0228bb58 },
    { 0x12fd, (void *)0x0228abd8 },
    { 0x19e1, (void *)0x0228ac74 },
    { 0x19e2, (void *)0x0228ac74 },
    { 0x1975, (void *)0x0228ad68 },
    { 0x1327, (void *)0x0228ae18 },
    { 0x1719, (void *)0x0228ae18 },
    { 0x1517, (void *)0x0228a974 },
    { 0x1b24, (void *)0x0228a974 },
    { 0x14b3, (void *)0x0228a974 },
    { 0x1928, (void *)0x0228acbc },
    { 0x192a, (void *)0x0228acbc },
    { 0x143f, (void *)0x0228ad20 },
    { 0x184b, (void *)0x0228ae94 },
    { 0x14d3, (void *)0x0228b0a0 },
    { 0x1538, (void *)0x0228b0a0 },
    { 0x1850, (void *)0x0228bba8 },
    { 0x1805, (void *)0x0228bba8 },
    { 0x14e6, (void *)0x0228af60 },
    { 0x166a, (void *)0x0228b3c4 },
    { 0x19b7, (void *)0x0229110c },
    { 0x183e, (void *)0x0228b478 },
    { 0x16a5, (void *)0x0228b4f4 },
    { 0x15f7, (void *)0x0228b204 },
    { 0x12f1, (void *)0x0228b810 },
    { 0x12f2, (void *)0x0228b810 },
    { 0x1329, (void *)0x0228b810 },
    { 0x132a, (void *)0x0228b810 },
    { 0x1330, (void *)0x0228b850 },
    { 0x12cf, (void *)0x0228b5f4 },
    { 0x12d0, (void *)0x0228b5f4 },
    { 0x145a, (void *)0x0228b5f4 },
    { 0x1548, (void *)0x0228b5f4 },
    { 0x1776, (void *)0x0228b5f4 },
    { 0x1378, (void *)0x0228b5f4 },
    { 0x12d2, (void *)0x0228b5f4 },
    { 0x1316, (void *)0x0228b5f4 },
    { 0x195f, (void *)0x0228b5f4 },
    { 0x19ec, (void *)0x0228b894 },
    { 0x15b8, (void *)0x0228b8c8 },
    { 0x175a, (void *)0x0228b8c8 },
    { 0x1a98, (void *)0x0228b9d8 },
    { 0x1a9a, (void *)0x0228b9d8 },
    { 0x1768, (void *)0x0228b9d8 },
};
