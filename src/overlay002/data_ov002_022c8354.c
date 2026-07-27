/* data_ov002_022c8354 (20 bytes, 4-aligned): NEW carve as part of
 * cm-data-inference-11, filling a previously-unclaimed delinks.txt gap
 * immediately after data_ov002_022c834c (this same wave).
 *
 * STRONG: sole consumer func_ov002_022651c4.s indexes this array via
 * `ldr r1,[r7,r0,lsl#0x2]; blx r1` (word-stride function-pointer call),
 * where the index is a runtime state-machine counter, explicitly
 * loop-bounded to exactly 5 (`cmp r0,#0x5; bcc`). Element count proven
 * 4 independent ways: byte-range math (20/4), relocs.txt relocation
 * count (exactly 5 words), target-function size chaining (0x18+0x18+
 * 0x18+0xac+0x70 lands exactly on the next function boundary), and the
 * consumer's own loop bound. Two sibling loops in the same consumer
 * drive the neighboring (still-uncarved) tables data_ov002_022c841c
 * (bound 0x2a=42) and data_ov002_022c8390 (bound 0x23=35) via the
 * identical idiom -- corroborating context, not this file's own claim.
 *
 * Raw address-literal casts (not named-function references or
 * `&func`), matching this project's own const-placement rule: either
 * form creates a real link-time relocation, which forces `.data`
 * placement regardless of `const` -- ground truth here is `.rodata`
 * (see delinks.txt), so literal casts are required even for the 3
 * targets that are already independently matched, real C functions.
 */

typedef int (*Ov002DuelStateHandler)(int, int, int, int);

const Ov002DuelStateHandler data_ov002_022c8354[5] = {
    (Ov002DuelStateHandler)0x02264fcc,
    (Ov002DuelStateHandler)0x02264fe4,
    (Ov002DuelStateHandler)0x02264ffc,
    (Ov002DuelStateHandler)0x02265014,
    (Ov002DuelStateHandler)0x022650c0,
};
