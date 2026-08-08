/* data_02102138 (24 bytes, 4-aligned): DuelHeapSlot slot 1 -- confirmed
 * sibling of data_02102120 (slot 0; typedef + family description in
 * src/main/data_02102120.c), part of the same 5-slot, 24-byte-stride
 * arena/allocator record family (data_02102120, data_02102138,
 * data_02102150, data_02102168, data_02102180; slots 3/4 not yet
 * carved). Real bytes decode (same field layout as slot 0) to cur=-1,
 * end=-1, base=0, unk_0x0c=1, slot_index=1, unk_0x12=-1 (0xffff),
 * unk_0x14=0x00020000.
 *
 * Consumers (both still .s, matching data_02102120.c's own precedent):
 *  - src/main/func_0207df20.s:27 (`ldr r3, _LIT2`, _LIT2 = data_02102138)
 *    -- companion-slot lookup: when the slot being walked has
 *    slot_index==0, this slot is used as its paired companion
 *    (`ldrh r4,[r5,#0x10]; cmp r4,#0x0; beq .L_80; mov r4, r3` at
 *    func_0207df20.s:40-47, r3 holding this LIT). relocs.txt:
 *    `from:0x0207e098 kind:load to:0x02102138 module:main`.
 *  - src/main/func_0207e0a8.s:16 (`ldr r5, _LIT1`, _LIT1 = data_02102120)
 *    walks all 5 slots via base+0x18*i pointer arithmetic (no separate
 *    reloc per slot; base reloc `from:0x0207e120 kind:load to:0x02102120
 *    module:main`) -- pins the +0x0/+0x4/+0x8/+0xc field roles and
 *    confirms unk_0x0c is read (`ldr ip,[r5,#0xc]; cmp ip,#0x0`) to pick
 *    which cur/end reset pair a slot gets; unk_0x0c=1 here (vs slot 0's
 *    0) selects the strne path (cur=0, end=0x10000) on reset.
 *  - src/main/data_0210210c.c (pointer table, index 4): relocs.txt
 *    `from:0x0210211c kind:load to:0x02102138 module:main`.
 *
 * CROSS-REGION: no src/jpn/main or src/usa/main file of this name
 * exists (checked directly); moot for build safety regardless, since
 * this unprefixed src/main/ TU is EUR-only by tools/configure.py's
 * region-scoping rule (see data_02102120.c's own precedent note).
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

DuelHeapSlot data_02102138 = {
    -1, -1, 0, 1, 1, -1, 0x00020000,
};
