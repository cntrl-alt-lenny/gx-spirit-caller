/* data_ov022_021ab8a8 (60 bytes, 4-aligned): retyped from opaque bytes
 * to an unsigned short[30] array as part of cm-data-inference-7 (a
 * "pitch"/blend-level table).
 *
 * STRONG: 4 computed-stride `ldrh` reads across 2 walled .s consumers
 * (func_ov022_021aabe8.s:118,128 and func_ov022_021aadf0.s:61,70,98,
 * 100,112,114), all indexed by a runtime-variable value freshly loaded
 * each time from a sibling table (data_ov022_021ab8e4), never a
 * compile-time-constant offset. relocs.txt confirms zero embedded
 * pointers. Element count (30) is inferred from stride/byte-size, not
 * an in-consumer loop bound -- flagged per the investigating agent's
 * own honest caveat, matching the established precedent for this
 * evidence tier (e.g. data_ov010_021b8908).
 */

const unsigned short data_ov022_021ab8a8[30] = {
    22, 22, 28, 18, 22, 22, 16, 22, 18, 10,
    22, 20, 18, 20, 22, 22, 8, 22, 12, 16,
    10, 22, 24, 20, 12, 18, 18, 22, 16, 28,
};
