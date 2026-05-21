/* Brief 174 bundle-extent generator output.
 *
 * Anchor: data_021010f0 @ 0x021010f0, size 28 bytes (7 words). Bundle terminates at the next
 * 4-aligned named symbol (0x0210110c).
 *
 * Subsumed placeholder symbols (load relocs to these addresses resolve via
 * patch_module_literals.py post-link — brief 152 workaround #3 mechanism):
 *   - data_021010f4 @ +0x4 (VA 0x021010f4)
 *
 * Bundle extent chosen by tools/cluster_b_bundle_gen.py (brief 174):
 * walk forward through named symbols, pick the first 4-aligned
 * named symbol such that the bundle contains at least 1 non-zero byte
 * (so mwcc emits to .data, not .bss). Reproduces brief 152/155 hand-tuned bundles byte-for-byte.
 */

unsigned int data_021010f0[7] = {
    0x00000000,
    0x7265765c,
    0x6e6f6973,
    0x5c64255c,
    0x75736572,
    0x255c746c,
    0x00000064,
};
