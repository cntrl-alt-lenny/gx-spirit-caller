/* data_02102150 (24 bytes, 4-aligned): DuelHeapSlot slot 2 -- sibling
 * of data_02102120 (slot 0) and data_02102138 (slot 1); see
 * src/main/data_02102120.c for the typedef/family description and
 * src/main/data_02102138.c for slot 1. Real bytes decode to cur=-1,
 * end=-1, base=0, unk_0x0c=1, slot_index=2, unk_0x12=-1 (0xffff),
 * unk_0x14=0x00030000.
 *
 * Consumers:
 *  - src/main/func_0207df20.s:26 (`ldr r2, _LIT1`, _LIT1 = data_02102150)
 *    -- companion-slot lookup: when the slot being walked has
 *    slot_index==3, this slot is used as its paired companion
 *    (`cmp r4,#0x3; beq .L_88; mov r4, r2` at func_0207df20.s:43-50).
 *    relocs.txt: `from:0x0207e094 kind:load to:0x02102150 module:main`.
 *  - src/main/func_0207e0a8.s: implicitly walked (base+0x18*2 from
 *    data_02102120; see data_02102138.c for the shared field-layout
 *    evidence from this consumer -- no separate per-slot reloc).
 *  - src/main/data_0210210c.c (pointer table, index 3): relocs.txt
 *    `from:0x02102118 kind:load to:0x02102150 module:main`.
 *
 * CROSS-REGION: no src/jpn/main or src/usa/main file of this name
 * exists (checked directly); EUR-only src/main/ TU, moot for build
 * safety per tools/configure.py's region-scoping rule.
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

DuelHeapSlot data_02102150 = {
    -1, -1, 0, 1, 2, -1, 0x00030000,
};
