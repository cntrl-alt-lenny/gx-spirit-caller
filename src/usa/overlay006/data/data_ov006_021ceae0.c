/* Brief 174 bundle-extent generator output.
 *
 * Anchor: data_ov006_021ceae0 @ 0x021ceae0, size 4 bytes (1 words). Bundle terminates at the next
 * 4-aligned named symbol (0x021ceae4).
 *
 * Bundle extent chosen by tools/cluster_b_bundle_gen.py (brief 174):
 * walk forward through named symbols, pick the first 4-aligned
 * named symbol such that the bundle contains at least 1 non-zero byte
 * (so mwcc emits to .data, not .bss). Reproduces brief 152/155 hand-tuned bundles byte-for-byte.
 */

unsigned int data_ov006_021ceae0[1] = {
    0x0000000a,  /* candidate value */
};
