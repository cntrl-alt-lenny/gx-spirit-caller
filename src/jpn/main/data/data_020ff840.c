/* Brief 174 bundle-extent generator output.
 *
 * Anchor: data_020ff840 @ 0x020ff840, size 64 bytes (16 words). Bundle terminates at the next
 * 4-aligned named symbol (0x020ff880).
 *
 * Subsumed placeholder symbols (load relocs to these addresses resolve via
 * patch_module_literals.py post-link — brief 152 workaround #3 mechanism):
 *   - data_020ff844 @ +0x4 (VA 0x020ff844)
 *   - data_020ff848 @ +0x8 (VA 0x020ff848)
 *
 * Bundle extent chosen by tools/cluster_b_bundle_gen.py (brief 174):
 * walk forward through named symbols, pick the first 4-aligned
 * named symbol such that the bundle contains at least 1 non-zero byte
 * (so mwcc emits to .data, not .bss). Reproduces brief 152/155 hand-tuned bundles byte-for-byte.
 */

unsigned int data_020ff840[16] = {
    0x00000000,
    0x00000000,
    0x61682049,
    0x61206576,
    0x6f687475,
    0x657a6972,
    0x6f792064,
    0x72207275,
    0x65757165,
    0x74207473,
    0x6461206f,
    0x656d2064,
    0x206f7420,
    0x72756f79,
    0x73696c20,
    0x00000074,
};
