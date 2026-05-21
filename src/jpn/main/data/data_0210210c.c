/* Brief 174 bundle-extent generator output.
 *
 * Anchor: data_0210210c @ 0x0210210c, size 20 bytes (5 words). Bundle terminates at the next
 * 4-aligned named symbol (0x02102120).
 *
 * Subsumed placeholder symbols (load relocs to these addresses resolve via
 * patch_module_literals.py post-link — brief 152 workaround #3 mechanism):
 *   - data_02102110 @ +0x4 (VA 0x02102110)
 *
 * Bundle extent chosen by tools/cluster_b_bundle_gen.py (brief 174):
 * walk forward through named symbols, pick the first 4-aligned
 * named symbol such that the bundle contains at least 1 non-zero byte
 * (so mwcc emits to .data, not .bss). Reproduces brief 152/155 hand-tuned bundles byte-for-byte.
 */

unsigned int data_0210210c[5] = {
    0x00000000,
    0x020842f8,
    0x00000000,
    0x00000000,
    0x00000000,
};
