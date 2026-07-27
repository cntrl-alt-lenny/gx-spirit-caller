/* data_ov002_022c9250 (696 bytes, 4-aligned): retyped from opaque bytes to
 * a typed struct array as part of cm-data-inference-3. One of 8
 * near-identical "card-ID -> handler-pointer pair" tables in this overlay
 * (data_ov002_022c86b8 [see below, also retyped this batch], _022c89a0,
 * _022c8ff0, _022c9010, _022c9038, _022c9508, _022c9ad0 are the other 7).
 *
 * The Ov002CardHandlerRecord type declared below matches the one already
 * shipped in data_ov002_022c9ad0.c/data_ov002_022c89a0.c verbatim -- one
 * semantic record shape, independently redeclared per TU per this
 * codebase's existing convention (no shared header).
 *
 * Evidence: direct unmatched .s consumer func_ov002_022989bc.s walks the
 * table with a runtime pointer accumulator (`r6 += 8` per iteration,
 * stride 8), loop bound `cmp r5,#0x57` = 87 records exactly (696/8) --
 * plus the shared record consumer func_ov002_02297158.s (already the
 * proven evidence source for the matched-C sibling data_ov002_022c9508,
 * func_ov002_02297c3c.legacy_sp3.c), which reads offset 0 as a plain
 * word (id, `ldr r5,[r1]`) and `ldr r2,[r2,#0x4]; blx r2` at offset 4
 * (handler, invoked directly).
 *
 * Pointer field emitted as a raw (void *)0x... literal-address cast (same
 * reasoning as every other table in this family). Byte content is an
 * exact reinterpretation of the same bytes previously shipped as
 * `const unsigned char data_ov002_022c9250[696]` -- mechanically parsed
 * out of the previous literal and round-trip-verified, never
 * hand-transcribed.
 */
typedef struct {
    unsigned int cardId;  /* offset 0x0 */
    void *handler;         /* offset 0x4 */
} Ov002CardHandlerRecord;

const Ov002CardHandlerRecord data_ov002_022c9250[87] = {
    { 0x1527, (void *)0x0229110c },
    { 0x152a, (void *)0x0229110c },
    { 0x152b, (void *)0x0229110c },
    { 0x152c, (void *)0x0229110c },
    { 0x152d, (void *)0x0229110c },
    { 0x152e, (void *)0x0229110c },
    { 0x1533, (void *)0x0229110c },
    { 0x1535, (void *)0x0229110c },
    { 0x16fa, (void *)0x0229110c },
    { 0x186e, (void *)0x0229110c },
    { 0x18b3, (void *)0x0229110c },
    { 0x18ba, (void *)0x0229110c },
    { 0x18bb, (void *)0x0229110c },
    { 0x18bd, (void *)0x0229110c },
    { 0x19f1, (void *)0x0229110c },
    { 0x16e4, (void *)0x02296e48 },
    { 0x1aa0, (void *)0x022957d0 },
    { 0x11a6, (void *)0x02295748 },
    { 0x1565, (void *)0x02295748 },
    { 0x158c, (void *)0x02295824 },
    { 0xfff, (void *)0x02295670 },
    { 0x1855, (void *)0x02295670 },
    { 0x17e1, (void *)0x022958a8 },
    { 0x1627, (void *)0x02295748 },
    { 0x1984, (void *)0x02296fa4 },
    { 0x16d7, (void *)0x02296f54 },
    { 0x1710, (void *)0x0229110c },
    { 0x1a14, (void *)0x0229110c },
    { 0x175f, (void *)0x022953ec },
    { 0x1537, (void *)0x022921e0 },
    { 0x17b4, (void *)0x022921e0 },
    { 0x169c, (void *)0x02295178 },
    { 0x1315, (void *)0x022923d0 },
    { 0x12ce, (void *)0x02291dc0 },
    { 0x159f, (void *)0x02292270 },
    { 0x15a4, (void *)0x022922c0 },
    { 0x130d, (void *)0x022945c4 },
    { 0x130e, (void *)0x022945c4 },
    { 0x13f3, (void *)0x022945c4 },
    { 0x149d, (void *)0x022945c4 },
    { 0x1318, (void *)0x022943f0 },
    { 0x15ee, (void *)0x0229230c },
    { 0x1429, (void *)0x02291160 },
    { 0x12dc, (void *)0x02291160 },
    { 0x162e, (void *)0x02291160 },
    { 0x1510, (void *)0x02291160 },
    { 0x16d0, (void *)0x02291160 },
    { 0x1662, (void *)0x02291160 },
    { 0x16d4, (void *)0x02291160 },
    { 0x159c, (void *)0x02291214 },
    { 0x13f5, (void *)0x02291214 },
    { 0x1102, (void *)0x022920dc },
    { 0x1400, (void *)0x022920dc },
    { 0x187c, (void *)0x022920dc },
    { 0x134a, (void *)0x022920dc },
    { 0x18d2, (void *)0x02296ebc },
    { 0x131d, (void *)0x0229110c },
    { 0x1320, (void *)0x0229110c },
    { 0x17a5, (void *)0x0229110c },
    { 0x1432, (void *)0x02291ed8 },
    { 0x1406, (void *)0x02291f00 },
    { 0x1469, (void *)0x02291e94 },
    { 0x12e0, (void *)0x022921a0 },
    { 0x1401, (void *)0x02291f58 },
    { 0x1627, (void *)0x02292020 },
    { 0x13ff, (void *)0x02291160 },
    { 0x13f0, (void *)0x02291114 },
    { 0x1738, (void *)0x02291160 },
    { 0x1628, (void *)0x02291160 },
    { 0x17a6, (void *)0x02294a60 },
    { 0x16cd, (void *)0x02291160 },
    { 0x14a1, (void *)0x02291160 },
    { 0x15a0, (void *)0x02291160 },
    { 0x17f8, (void *)0x02291160 },
    { 0x1539, (void *)0x02291ffc },
    { 0x150e, (void *)0x02291fa8 },
    { 0x1667, (void *)0x02291160 },
    { 0x1760, (void *)0x02291160 },
    { 0x1777, (void *)0x02291160 },
    { 0x17a4, (void *)0x02291160 },
    { 0x1843, (void *)0x02291160 },
    { 0x187d, (void *)0x02291160 },
    { 0x1971, (void *)0x02291160 },
    { 0x142c, (void *)0x02291160 },
    { 0x175d, (void *)0x02291160 },
    { 0x1513, (void *)0x0229110c },
    { 0x132c, (void *)0x0229110c },
};
