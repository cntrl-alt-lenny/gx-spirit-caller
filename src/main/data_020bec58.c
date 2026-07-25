/* data_020bec58 -- 13-entry bitmask table (52 bytes, 4-aligned).
 *
 * Sole consumer func_0203e3d4.legacy_sp3.c: `data_020bec58[a2]` with a2
 * clamped `if (a2 > 12) a2 = 12;` -- computed, register-scaled (lsl #2)
 * stride, bound proven by the clamp itself (13 slots, 0-12) and matching
 * 52/4=13 exactly. All 7 call sites feed a2 from a runtime-loaded field,
 * never a hardcoded immediate. Values are a clean walking-bit sequence,
 * value[i] = 0x8000 | (2 << i), consistent with the consumer's use
 * (`a3 | data_020bec58[a2]`, an OR'd status flag). Element type `int`
 * matches the already-compiling consumer's own `extern int
 * data_020bec58[];` declaration exactly -- this retype removes a
 * pre-existing cross-TU type mismatch rather than introducing one.
 * See docs/research/data/cm-data-inference-4-2026-07-25.md.
 */

const int data_020bec58[13] = {
    0x00008002, 0x00008004, 0x00008008, 0x00008010,
    0x00008020, 0x00008040, 0x00008080, 0x00008100,
    0x00008200, 0x00008400, 0x00008800, 0x00009000,
    0x0000a000,
};
