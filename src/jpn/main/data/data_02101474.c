/* Brief 174 bundle-extent generator output.
 *
 * Anchor: data_02101474 @ 0x02101474, size 36 bytes (9 words). Bundle terminates at the next
 * 4-aligned named symbol (0x02101498).
 *
 * Subsumed placeholder symbols (load relocs to these addresses resolve via
 * patch_module_literals.py post-link — brief 152 workaround #3 mechanism):
 *   - data_02101478 @ +0x4 (VA 0x02101478)
 *
 * Bundle extent chosen by tools/cluster_b_bundle_gen.py (brief 174):
 * walk forward through named symbols, pick the first 4-aligned
 * named symbol such that the bundle contains at least 1 non-zero byte
 * (so mwcc emits to .data, not .bss). Reproduces brief 152/155 hand-tuned bundles byte-for-byte.
 */

unsigned int data_02101474[9] = {
    0x00000000,
    0x206e656c,
    0x5447203c,
    0x535f3249,
    0x4b434154,
    0x534f485f,
    0x4e454c54,
    0x58414d5f,
    0x00000000,
};
