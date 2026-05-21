/* Brief 174 bundle-extent generator output.
 *
 * Anchor: data_020ff828 @ 0x020ff828, size 12 bytes (3 words). Bundle terminates at the next
 * 4-aligned named symbol (0x020ff834).
 *
 * Subsumed placeholder symbols (load relocs to these addresses resolve via
 * patch_module_literals.py post-link — brief 152 workaround #3 mechanism):
 *   - data_020ff82c @ +0x4 (VA 0x020ff82c)
 *
 * Bundle extent chosen by tools/cluster_b_bundle_gen.py (brief 174):
 * walk forward through named symbols, pick the first 4-aligned
 * named symbol such that the bundle contains at least 1 non-zero byte
 * (so mwcc emits to .data, not .bss). Reproduces brief 152/155 hand-tuned bundles byte-for-byte.
 */

unsigned int data_020ff828[3] = {
    0x00000000,
    0x4d435047,
    0x00000000,
};
