/* Brief 174 bundle-extent generator output.
 *
 * Anchor: data_020c69bc @ 0x020c69bc, size 24 bytes (6 words). Bundle terminates at the next
 * 4-aligned named symbol (0x020c69d4).
 *
 * Subsumed placeholder symbols (load relocs to these addresses resolve via
 * patch_module_literals.py post-link — brief 152 workaround #3 mechanism):
 *   - data_020c69c0 @ +0x4 (VA 0x020c69c0)
 *
 * Bundle extent chosen by tools/cluster_b_bundle_gen.py (brief 174):
 * walk forward through named symbols, pick the first 4-aligned
 * named symbol such that the bundle contains at least 1 non-zero byte
 * (so mwcc emits to .data, not .bss). Reproduces brief 152/155 hand-tuned bundles byte-for-byte.
 */

unsigned int data_020c69bc[6] = {
    0x00000000,
    0x64726163,
    0x5241432f,
    0x62355f44,
    0x2e363267,
    0x006e6962,
};
