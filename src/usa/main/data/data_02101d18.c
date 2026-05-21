/* Brief 174 bundle-extent generator output.
 *
 * Anchor: data_02101d18 @ 0x02101d18, size 32 bytes (8 words). Bundle terminates at the next
 * 4-aligned named symbol (0x02101d38).
 *
 * Subsumed placeholder symbols (load relocs to these addresses resolve via
 * patch_module_literals.py post-link — brief 152 workaround #3 mechanism):
 *   - data_02101d1c @ +0x4 (VA 0x02101d1c)
 *
 * Bundle extent chosen by tools/cluster_b_bundle_gen.py (brief 174):
 * walk forward through named symbols, pick the first 4-aligned
 * named symbol such that the bundle contains at least 1 non-zero byte
 * (so mwcc emits to .data, not .bss). Reproduces brief 152/155 hand-tuned bundles byte-for-byte.
 */

unsigned int data_02101d18[8] = {
    0x00000000,
    0x6d2e7325,
    0x2e642573,
    0x6e2e7367,
    0x65746e69,
    0x776f646e,
    0x2e696669,
    0x0074656e,
};
