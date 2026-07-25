/* data_020c3084 (260 bytes, 4-aligned): retyped from opaque bytes via
 * STRUCTURAL INFERENCE (cm-data-inference-2 batch 1, following the
 * cm-data-inference-probe methodology documented in
 * docs/research/data/inference-probe-main-2026-07-24.md — no .inc oracle
 * exists for this blob). Evidence: 1 unmatched .s consumer
 * (func_0208c66c.s), 2 access sites (`idx = helperResult>>5`, then
 * `idx*2` / `ldrsh` — a signed halfword load, hence `short` not
 * `unsigned short`, with add and subtract branches) — a genuine
 * stride-2, 130-record, single-signed-16-bit-field table. Content: a
 * monotonic 0->8192 arctan-shaped curve, one octant of a 65536-unit
 * circle — the consumer's own branch constants are exact octant
 * boundaries (0x0/0x2000/0x4000/0x6000/0x8000/0xa000/0xc000/0xe000, all
 * present in func_0208c66c.s) — strong self-corroboration. 130 = 129
 * meaningful entries (indices 0-128, index 128 = 8192) plus 1 trailing
 * zero-pad for 4-byte .rodata alignment (this was always about
 * alignment, nothing to change there). NOTE: a cross-region lookalike
 * (`data_020c3094` in USA/JPN) was investigated and conclusively ruled
 * out as a coincidental address match, not the same table — unrelated
 * to this EUR-baseline retype. The sole consumer references this symbol
 * only via a raw literal-pool address load (`.extern` + `.word`), never
 * through a C-level type, so retyping the declaration here has zero
 * effect on its behavior. Byte content is an exact reinterpretation of
 * the same bytes previously shipped as `const unsigned char
 * data_020c3084[260]` — this retype changes only the C-level type, not
 * any byte value (re-derived by script directly from the
 * previously-committed byte literal, not hand-transcribed).
 */

const short data_020c3084[130] = {
    0, 81, 163, 244, 326, 407, 489, 570, 651, 732,
    813, 894, 975, 1056, 1136, 1217, 1297, 1377, 1457, 1537,
    1617, 1696, 1775, 1854, 1933, 2012, 2090, 2168, 2246, 2324,
    2401, 2478, 2555, 2632, 2708, 2784, 2860, 2935, 3010, 3085,
    3159, 3233, 3307, 3380, 3453, 3526, 3599, 3670, 3742, 3813,
    3884, 3955, 4025, 4095, 4164, 4233, 4302, 4370, 4438, 4505,
    4572, 4639, 4705, 4771, 4836, 4901, 4966, 5030, 5094, 5157,
    5220, 5282, 5344, 5406, 5467, 5528, 5589, 5649, 5708, 5768,
    5826, 5885, 5943, 6000, 6058, 6114, 6171, 6227, 6282, 6337,
    6392, 6446, 6500, 6554, 6607, 6660, 6712, 6764, 6815, 6867,
    6917, 6968, 7018, 7068, 7117, 7166, 7214, 7262, 7310, 7358,
    7405, 7451, 7498, 7544, 7589, 7635, 7679, 7724, 7768, 7812,
    7856, 7899, 7942, 7984, 8026, 8068, 8110, 8151, 8192, 0,
};
