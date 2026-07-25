/* data_020c3754 (256 bytes, 4-aligned): retyped from opaque bytes via
 * STRUCTURAL INFERENCE (cm-data-inference-2 batch 1, following the
 * cm-data-inference-probe methodology documented in
 * docs/research/data/inference-probe-main-2026-07-24.md — no .inc oracle
 * exists for this blob). Evidence: 9 unmatched .s consumers
 * (func_02064dfc.s, func_02068a20.s, func_020a7530.s, func_020a85ec.s,
 * func_020a9960.s, func_020a9e58.s, func_020ab130.s, func_020ac46c.s,
 * func_020ac854.s), ~25+ access sites, all `idx*2` / `ldrh`, zero
 * fixed-offset-only reads — a genuine stride-2, 128-record,
 * single-u16-field table. Content is an exact match for the standard
 * 11-class C <ctype.h> bitmask layout (alpha/blank/cntrl/digit/graph/
 * lower/print/punct/space/upper/xdigit bits) — identical to the low 128
 * entries of data_020c398c (the sibling ctype table one TU over), every
 * mask used in the disassembly matches its real semantic meaning with
 * zero exceptions. All 9 consumers reference this symbol only via a raw
 * literal-pool address load (`.extern` + `.word`), never through a
 * C-level type, so retyping the declaration here has zero effect on
 * their behavior. Byte content is an exact reinterpretation of the same
 * bytes previously shipped as `const unsigned char data_020c3754[256]`
 * — this retype changes only the C-level type, not any byte value
 * (re-derived by script directly from the previously-committed byte
 * literal, not hand-transcribed).
 */

const unsigned short data_020c3754[128] = {
    0x0004, 0x0004, 0x0004, 0x0004, 0x0004, 0x0004, 0x0004, 0x0004,
    0x0004, 0x0106, 0x0104, 0x0104, 0x0104, 0x0104, 0x0004, 0x0004,
    0x0004, 0x0004, 0x0004, 0x0004, 0x0004, 0x0004, 0x0004, 0x0004,
    0x0004, 0x0004, 0x0004, 0x0004, 0x0004, 0x0004, 0x0004, 0x0004,
    0x0142, 0x00d0, 0x00d0, 0x00d0, 0x00d0, 0x00d0, 0x00d0, 0x00d0,
    0x00d0, 0x00d0, 0x00d0, 0x00d0, 0x00d0, 0x00d0, 0x00d0, 0x00d0,
    0x0458, 0x0458, 0x0458, 0x0458, 0x0458, 0x0458, 0x0458, 0x0458,
    0x0458, 0x0458, 0x00d0, 0x00d0, 0x00d0, 0x00d0, 0x00d0, 0x00d0,
    0x00d0, 0x0651, 0x0651, 0x0651, 0x0651, 0x0651, 0x0651, 0x0251,
    0x0251, 0x0251, 0x0251, 0x0251, 0x0251, 0x0251, 0x0251, 0x0251,
    0x0251, 0x0251, 0x0251, 0x0251, 0x0251, 0x0251, 0x0251, 0x0251,
    0x0251, 0x0251, 0x0251, 0x00d0, 0x00d0, 0x00d0, 0x00d0, 0x00d0,
    0x00d0, 0x0471, 0x0471, 0x0471, 0x0471, 0x0471, 0x0471, 0x0071,
    0x0071, 0x0071, 0x0071, 0x0071, 0x0071, 0x0071, 0x0071, 0x0071,
    0x0071, 0x0071, 0x0071, 0x0071, 0x0071, 0x0071, 0x0071, 0x0071,
    0x0071, 0x0071, 0x0071, 0x00d0, 0x00d0, 0x00d0, 0x00d0, 0x0004,
};
