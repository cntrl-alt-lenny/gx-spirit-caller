/* data_ov002_022ca370 (32 bytes, 4-aligned): retyped from opaque bytes to
 * const unsigned short[16] as part of cm-data-inference-8. Resolved-with-
 * caveat cross-region CONTRADICTION, not a plain STRONG:
 *
 * EUR evidence is clean and STRONG on its own -- two consumers
 * (func_ov002_0229a04c.c, func_ov002_0229a060.c, both already-matched C)
 * read this symbol at halfword stride via a runtime-computed index, and
 * EUR's own relocs.txt has zero internal relocations in the range.
 *
 * USA/JPN's *own* dsd-derived symbol tables instead split the same 32
 * bytes into two independent 16-byte objects, and their GLOBAL_ASM ground
 * truth (func_ov002_022a73a4.s, byte-exact original disassembly) reads
 * that content at BYTE stride via a different runtime index -- a genuine
 * divergence in how each region's code actually consumes these bytes, not
 * a transcription error.
 *
 * This retype is byte-safe for all three regions regardless: this file
 * has no region override, so USA/JPN's shipped bytes are unaffected by
 * the *defining* TU's C type (their consumer is raw assembly addressing
 * memory by symbol name/offset, indifferent to how the EUR baseline TU
 * spells the type) -- and unsigned short[16] matches EUR's own two
 * consumers' extern declarations exactly. The cross-region shape
 * divergence itself is a fact about the original game, not something this
 * retype can or should paper over; recorded here rather than silently
 * dropped.
 */

const unsigned short data_ov002_022ca370[16] = {
    0x0fce, 0x0fd3, 0x11b2, 0x11c2, 0x11c3, 0x1649, 0x1757, 0x190b,
    0x190d, 0x191c, 0x191d, 0x19bd, 0x19cc, 0x1a2f, 0x1a8f, 0x1ae0,
};
