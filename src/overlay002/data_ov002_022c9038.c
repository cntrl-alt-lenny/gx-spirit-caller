/* data_ov002_022c9038 (536 bytes, 4-aligned): retyped from opaque bytes to
 * a typed struct array as part of cm-data-inference-3. One of 8
 * near-identical "card-ID -> handler-pointer pair" tables in this overlay
 * (data_ov002_022c86b8/_022c9250 [see below, also retyped this batch],
 * _022c89a0, _022c8ff0, _022c9010, _022c9508, _022c9ad0 are the other 7).
 *
 * The Ov002CardHandlerRecord type declared below matches the one already
 * shipped in data_ov002_022c9ad0.c/data_ov002_022c89a0.c verbatim -- one
 * semantic record shape, independently redeclared per TU per this
 * codebase's existing convention (no shared header).
 *
 * Evidence: direct unmatched .s consumer func_ov002_02297b34.s walks the
 * table with a runtime pointer accumulator (`r6 += 8` per iteration,
 * stride 8), loop bound `cmp r5,#0x43` = 67 records exactly (536/8) --
 * plus the shared record consumer func_ov002_02297158.s (already the
 * proven evidence source for the matched-C sibling data_ov002_022c9508,
 * func_ov002_02297c3c.legacy_sp3.c), which reads offset 0 as a plain
 * word (id, `ldr r5,[r1]`) and `ldr r2,[r2,#0x4]; blx r2` at offset 4
 * (handler, invoked directly). relocs.txt independently confirms a
 * code-pointer relocation at every one of the 67 offset-4 words, all
 * 67/67 resolving to real function-symbol starts in symbols.txt.
 *
 * Pointer field emitted as a raw (void *)0x... literal-address cast (same
 * reasoning as every other table in this family). Byte content is an
 * exact reinterpretation of the same bytes previously shipped as
 * `const unsigned char data_ov002_022c9038[536]` -- mechanically parsed
 * out of the previous literal and round-trip-verified, never
 * hand-transcribed.
 */
typedef struct {
    unsigned int cardId;  /* offset 0x0 */
    void *handler;         /* offset 0x4 */
} Ov002CardHandlerRecord;

const Ov002CardHandlerRecord data_ov002_022c9038[67] = {
    { 0x1407, (void *)0x022913a8 },
    { 0x1246, (void *)0x02291418 },
    { 0x131b, (void *)0x02291640 },
    { 0x14df, (void *)0x02291640 },
    { 0x15fe, (void *)0x02291160 },
    { 0x17a3, (void *)0x02291160 },
    { 0x16d1, (void *)0x02292998 },
    { 0x10f6, (void *)0x02292998 },
    { 0x12eb, (void *)0x02291114 },
    { 0x12e6, (void *)0x02291114 },
    { 0x149b, (void *)0x02291114 },
    { 0x132d, (void *)0x02291440 },
    { 0x137c, (void *)0x02291440 },
    { 0x132e, (void *)0x02291468 },
    { 0x1363, (void *)0x02291114 },
    { 0x1364, (void *)0x02291114 },
    { 0x10f8, (void *)0x022912c8 },
    { 0x10f9, (void *)0x022912c8 },
    { 0x10fa, (void *)0x022912c8 },
    { 0x10fb, (void *)0x022912c8 },
    { 0x10fc, (void *)0x022912c8 },
    { 0x12e8, (void *)0x022912c8 },
    { 0x1761, (void *)0x022912c8 },
    { 0x141f, (void *)0x022912c8 },
    { 0x15e7, (void *)0x022912c8 },
    { 0x159b, (void *)0x02291160 },
    { 0x1460, (void *)0x0229110c },
    { 0x1101, (void *)0x022913cc },
    { 0x1100, (void *)0x022912e0 },
    { 0x10ff, (void *)0x022912e0 },
    { 0x10fd, (void *)0x022912e0 },
    { 0x10fe, (void *)0x022912e0 },
    { 0x12e9, (void *)0x022912e0 },
    { 0x1307, (void *)0x022912e0 },
    { 0x1460, (void *)0x022912e0 },
    { 0x188b, (void *)0x022912e0 },
    { 0x1324, (void *)0x0229110c },
    { 0x1325, (void *)0x0229110c },
    { 0x132b, (void *)0x0229110c },
    { 0x12c8, (void *)0x0229110c },
    { 0x159a, (void *)0x0229110c },
    { 0x149e, (void *)0x0229110c },
    { 0x17a7, (void *)0x0229110c },
    { 0x17dd, (void *)0x0229110c },
    { 0x114f, (void *)0x022961a0 },
    { 0x179c, (void *)0x022961bc },
    { 0x132f, (void *)0x0229110c },
    { 0x12f9, (void *)0x02291b44 },
    { 0x1389, (void *)0x02291bfc },
    { 0x15c7, (void *)0x02292dac },
    { 0x18d9, (void *)0x02292f3c },
    { 0x12be, (void *)0x02291d10 },
    { 0x15a1, (void *)0x02291214 },
    { 0x1534, (void *)0x02291214 },
    { 0x1a67, (void *)0x0229282c },
    { 0x1238, (void *)0x02294158 },
    { 0x15a2, (void *)0x02291160 },
    { 0x15ec, (void *)0x02291160 },
    { 0x187b, (void *)0x02291160 },
    { 0x150f, (void *)0x02291160 },
    { 0x1403, (void *)0x02291160 },
    { 0x146f, (void *)0x02292578 },
    { 0x14cf, (void *)0x02291160 },
    { 0x16da, (void *)0x02291160 },
    { 0x1a33, (void *)0x02291160 },
    { 0x1444, (void *)0x02291160 },
    { 0x19da, (void *)0x02291160 },
};
