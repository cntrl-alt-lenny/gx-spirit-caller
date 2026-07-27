/* data_02102120 (24 bytes, 4-aligned): retyped from opaque bytes to a
 * 6-field struct as part of cm-data-inference-10 -- slot 0 of a 5-slot,
 * 24-byte-stride arena/allocator-style record family (siblings
 * data_02102138/_02102150/_02102168/_02102180, not yet carved). Indexed
 * via data_02102104[2] and data_0210210c[5] (src/main/data_02102104.c,
 * src/main/data_0210210c.c), walked/reset by two independently-read
 * consumers: func_0207e0a8.s (direct 5x0x18-stride array walk, proving
 * fields at +0x0/+0x4/+0x8/+0xc and the 5-slot loop bound) and
 * func_0207df20.s (table-indirected 5-iteration loop reading
 * +0x0/+0x4/+0x8/+0x14, plus a +0x10 halfword branched 0 vs 3). Cross-
 * validated byte-for-byte against raw ROM content across 4 of the 5
 * sibling slots -- the +0x10 halfword equals each slot's own 0-based
 * index; +0x12 is a constant 0xffff on every visible sibling, unread by
 * any known consumer (almost certainly alignment padding after the
 * short at +0x10).
 *
 * CROSS-REGION NOTE: USA/JPN hold unrelated content at this same
 * absolute address (a function-pointer dispatch table consumed by
 * src/usa|jpn/main/func_02084130.s, plus an independently-split
 * data_02102130 sub-object consumed by func_020827cc.s) -- a real
 * CONTRADICTION first found in wave 5 and declined there. Resolved here:
 * this TU is EUR-only by construction (tools/configure.py's
 * _is_region_source_excluded excludes unprefixed src/main/* from
 * non-EUR builds, pinned by tests/test_configure_regions.py), so this
 * shape change cannot affect USA or JPN bytes even in principle -- a
 * stronger, build-config-proven version of the byte-safety argument
 * used for data_ov002_022ca370 (wave 8) and data_ov002_022ca390
 * (wave 9).
 */

typedef struct {
    int cur;          /* +0x00 */
    int end;           /* +0x04 */
    int base;            /* +0x08 -- 0 == slot unused */
    int unk_0x0c;          /* +0x0c */
    short slot_index;        /* +0x10 -- equals this slot's own 0-based index */
    short unk_0x12;            /* +0x12 -- constant 0xffff on every sibling; unread */
    int unk_0x14;                /* +0x14 */
} DuelHeapSlot;

DuelHeapSlot data_02102120 = {
    -1, -1, 0, 0, 0, -1, 0,
};
