/* data_020c2f80 (260 bytes, 4-aligned): retyped from opaque bytes via
 * STRUCTURAL INFERENCE (cm-data-inference-2 batch 1, following the
 * cm-data-inference-probe methodology documented in
 * docs/research/data/inference-probe-main-2026-07-24.md — no .inc oracle
 * exists for this blob). Evidence: 1 unmatched .s consumer
 * (func_0208c490.s), 2 access sites (`idx = helperResult>>5`, then
 * `idx*2` / `ldrsh` — a signed halfword load, hence `short` not
 * `unsigned short`) — a genuine stride-2, 130-record,
 * single-signed-16-bit-field table. Content: a monotonic 0->3217
 * arctan-shaped curve; the table's own boundary value (index 128 =
 * 3217) is independently reproduced as a literal constant (`_LIT1` =
 * 0x00000c91 = 3217) inside the SAME consumer function — strong
 * self-corroboration. 130 = 129 meaningful entries (indices 0-128) plus
 * 1 trailing zero-pad for 4-byte .rodata alignment (this was always
 * about alignment, nothing to change there). The sole consumer
 * references this symbol only via a raw literal-pool address load
 * (`.extern` + `.word`), never through a C-level type, so retyping the
 * declaration here has zero effect on its behavior. Byte content is an
 * exact reinterpretation of the same bytes previously shipped as
 * `const unsigned char data_020c2f80[260]` — this retype changes only
 * the C-level type, not any byte value (re-derived by script directly
 * from the previously-committed byte literal, not hand-transcribed).
 */

const short data_020c2f80[130] = {
    0, 32, 64, 96, 128, 160, 192, 224, 256, 288,
    319, 351, 383, 415, 446, 478, 509, 541, 572, 604,
    635, 666, 697, 728, 759, 790, 821, 852, 882, 913,
    943, 973, 1003, 1033, 1063, 1093, 1123, 1153, 1182, 1211,
    1241, 1270, 1299, 1327, 1356, 1385, 1413, 1441, 1470, 1498,
    1525, 1553, 1581, 1608, 1635, 1662, 1689, 1716, 1743, 1769,
    1795, 1822, 1848, 1873, 1899, 1925, 1950, 1975, 2000, 2025,
    2050, 2074, 2099, 2123, 2147, 2171, 2195, 2218, 2242, 2265,
    2288, 2311, 2334, 2356, 2379, 2401, 2423, 2445, 2467, 2489,
    2510, 2531, 2553, 2574, 2595, 2615, 2636, 2656, 2676, 2697,
    2716, 2736, 2756, 2775, 2795, 2814, 2833, 2852, 2871, 2889,
    2908, 2926, 2944, 2962, 2980, 2998, 3016, 3033, 3051, 3068,
    3085, 3102, 3119, 3135, 3152, 3168, 3185, 3201, 3217, 0,
};
