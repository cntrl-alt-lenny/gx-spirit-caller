/* data_020b4728 -- 16-colour RGB555 palette ramp (32 bytes, 4-aligned).
 *
 * Copied whole (never indexed) into DS palette RAM by 27 independent
 * call sites across 14 modules (main + 13 overlays), every one loading
 * this base address with a hardcoded length of exactly 0x20 into one of
 * three copy helpers (func_02094550 / func_0208ff84 / func_0208ffec),
 * confirmed by relocs.txt to target only the base address (no embedded
 * pointers, no sub-offset access). Values decode to a clean 16-step
 * black-to-white RGB555 grayscale ramp. Matches the exact type/idiom of
 * the immediately-adjacent, already-shipped sibling data_020b4748
 * (const unsigned short[16]), confirmed consumed the identical way.
 * See docs/research/data/cm-data-inference-4-2026-07-25.md.
 */

const unsigned short data_020b4728[16] = {
    0x0000, 0x0842, 0x1084, 0x18c6, 0x2108, 0xa94a, 0x318c, 0x39ce,
    0x4210, 0x4a52, 0x52b4, 0x5af6, 0x6338, 0x6b7a, 0x73bc, 0xffff,
};
