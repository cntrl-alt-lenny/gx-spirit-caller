/* data_020b4768 -- scalar record count (4 bytes, 4-aligned).
 *
 * Gates `for (i = 1; i < n; i++) func_0202b0e0(i)` across 13 independent
 * call sites spanning 5 modules (main, ov002, ov006 x5, ov017, ov021),
 * all textually unrelated, all agreeing on a single 32-bit scalar read
 * used as a loop bound -- proven a single scalar, not an array, by the
 * symbol table itself (the next symbol starts exactly 4 bytes later, so
 * the object physically cannot be anything but one word). func_0202b0e0
 * indexes the genuinely 8-byte-strided data_0219a93c.p0->entries_30[]
 * array; this scalar is that array's element count (value 1460).
 * See docs/research/data/cm-data-inference-4-2026-07-25.md.
 */

const int data_020b4768 = 1460;
