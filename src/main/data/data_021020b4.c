/* Brief 152 workaround #3a — `unsigned int` bundle test.
 *
 * Brief 148 / 149 / 152-part-1 falsified the naive single-byte
 * recipes (`.c` with `__attribute__((aligned(1)))`, `.s` with
 * `.byte`). Root cause: arm9.lcf's `ALIGNALL(2)` directive
 * forces every section to a 4-byte alignment, overriding any
 * per-source alignment hint — leaving a 3-byte pad gap between
 * any sub-4-byte section and the next 4-byte-aligned section.
 *
 * Workaround #3a: bundle the entire deduced range of the
 * surrounding placeholder pair as a single TU. `data_021020b4`
 * (1 byte, value 0x80) and `data_021020b5` (the rest of the gap
 * until the next named symbol at 0x021020f4 = 63 bytes of zeros)
 * are claimed together as a 64-byte `unsigned int[16]` array.
 * Naturally 4-aligned + multiple of 4 bytes → ALIGNALL(2) adds
 * zero padding.
 *
 * The placeholder `data_021020b5` is subsumed by this claim. Its
 * upstream load reloc (`from:0x02078494 kind:load to:0x021020b5
 * module:main` per relocs.txt) resolves correctly because the
 * load encodes the absolute address 0x021020b5, and that byte
 * exists in the linked binary as the second byte of the first
 * `unsigned int` in this array.
 */

unsigned int data_021020b4[16] = {
    0x00000080,
    0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0,
};
