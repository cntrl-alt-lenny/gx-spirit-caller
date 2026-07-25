/* data_020bec1c -- 2-field zone-order table (32 bytes).
 *
 * Sole consumer func_0203bad0.s walks this object byte-by-byte (stride
 * 1, 0xFF-terminated) from one of two entry points: offset 0 by default,
 * or offset 0x11 (17) when a global singleton pointer is non-NULL
 * (`addne r9, r5, #0x11`). Both split fields independently verified:
 * each is a full/partial permutation of the 16 zone indices [0x0,0xf]
 * matching the size of the sibling flag array data_0219d9a8 (16 bytes),
 * and each terminates on 0xFF exactly at its own declared length --
 * doubly cross-checked, not assumed. No computed idx*N stride exists
 * (pure r9++ walk), so element type stays unsigned char, matching the
 * pre-existing declaration exactly; only the split into 2 named fields
 * is new. See docs/research/data/cm-data-inference-4-2026-07-25.md.
 */

typedef struct {
    unsigned char order_all[17];      /* offset 0x00 -- full 16-zone
                                          permutation, 0xFF-terminated.
                                          Selected when the singleton
                                          pointer is NULL. */
    unsigned char order_excl_1_3[15]; /* offset 0x11 -- same order with
                                          zones 0x01/0x03 removed,
                                          0xFF-terminated. Selected when
                                          the singleton is non-NULL. */
} ZoneOrderTable020bec1c;

const ZoneOrderTable020bec1c data_020bec1c = {
    .order_all      = { 0x0f, 0x0d, 0x0e, 0x0c, 0x0b, 0x0a, 0x01, 0x03,
                         0x02, 0x00, 0x09, 0x08, 0x07, 0x06, 0x05, 0x04,
                         0xff },
    .order_excl_1_3 = { 0x0f, 0x0d, 0x0e, 0x0c, 0x0b, 0x0a, 0x02, 0x00,
                         0x09, 0x08, 0x07, 0x06, 0x05, 0x04, 0xff },
};
