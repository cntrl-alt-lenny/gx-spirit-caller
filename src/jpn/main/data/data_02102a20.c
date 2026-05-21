/* Brief 174 bundle-extent generator output.
 *
 * Anchor: data_02102a20 @ 0x02102a20, size 72 bytes (18 words). Bundle terminates at the next
 * 4-aligned named symbol (0x02102a68).
 *
 * Subsumed placeholder symbols (load relocs to these addresses resolve via
 * patch_module_literals.py post-link — brief 152 workaround #3 mechanism):
 *   - data_02102a24 @ +0x4 (VA 0x02102a24)
 *   - data_02102a28 @ +0x8 (VA 0x02102a28)
 *
 * Bundle extent chosen by tools/cluster_b_bundle_gen.py (brief 174):
 * walk forward through named symbols, pick the first 4-aligned
 * named symbol such that the bundle contains at least 1 non-zero byte
 * (so mwcc emits to .data, not .bss). Reproduces brief 152/155 hand-tuned bundles byte-for-byte.
 */

unsigned int data_02102a20[18] = {
    0x00000000,
    0x00000000,
    0x00000000,
    0x40240000,
    0x00000000,
    0x40590000,
    0x00000000,
    0x408f4000,
    0x00000000,
    0x40c38800,
    0x00000000,
    0x40f86a00,
    0x00000000,
    0x412e8480,
    0x00000000,
    0x416312d0,
    0x00000000,
    0x4197d784,
};
