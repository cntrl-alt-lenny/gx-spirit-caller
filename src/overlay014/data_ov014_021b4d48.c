/* data_ov014_021b4d48 (12 bytes, 4-aligned): HitRect entry 0 of a 6-
 * element array-of-struct family (siblings data_ov014_021b4d54/_60/_6c/
 * _78/_84, contiguous, same 12-byte stride). Reuses the `HitRect`
 * typedef already shipped in src/overlay014/Ov014_HitTestPrimary.c (x/y
 * u16, w/h u8, a 4-byte "pad6", attr u16 at +0xa).
 *
 * TWO readers (matches the census):
 *  1. func_ov014_021b2908 (map name Ov014_DrawPaneAHUD) --
 *     src/overlay014/func_ov014_021b2908.s. Loads this element's address
 *     via two separate literal-pool words in the SAME function (both
 *     resolve here, which is why relocs.txt shows 2 raw lines for 1
 *     reader function): `.L_021b2ecc` (line 42) used at :42-71 for the
 *     element-0 hit-test block (reads +0x0/+0x2 into a local rect scaled
 *     <<12, calls Ov014_HitTestPrimary(pane, &elem), reads +0x6/+0x8 and
 *     forwards them as extra stack args to func_0201e964), and
 *     `.L_021b2ed4` (line 56) reused as a FIXED base for a 2-iteration
 *     OAM sub-tile loop in switch case 0 (:278-312), then reused AGAIN
 *     as a DYNAMICALLY-INDEXED base in case 1 (:313-330: `mov r0,#0xc;
 *     mul r3,r1,r0; ldr r1,.L_021b2ed4; ldrh r4,[r1,r3]` = `base[cursor
 *     +1]`) and case 2 (:340-357: `base[cursor+3]`, same 0xc stride) --
 *     this dynamic indexing with an explicit 12-byte stride is the
 *     direct proof the 6 siblings are one coherent HitRect[6] array, not
 *     6 unrelated symbols. relocs.txt:109 and :111 (both to 0x021b4d48).
 *  2. func_ov014_021b3568 (map name Ov014_UpdateCursorMenu) --
 *     src/overlay014/func_ov014_021b3568.s:133-148. Loads `_LIT1 =
 *     data_ov014_021b4d48` as the array BASE and loops exactly 6 times
 *     (`cmp r5,#0x6`), advancing the pointer by `#0xc` each iteration
 *     and calling `Ov014_HitTestSecondary(pane, r6)` per element --
 *     independent confirmation of both the 6-element count and the
 *     12-byte stride. relocs.txt:185 (from:0x021b3794 to:0x021b4d48).
 * (docs/research/retriage/SmallOverlaysRetriageR8.md independently
 * flagged this exact family pre-verification: "data_ov014_021b4d48 (+5
 * siblings) wider-than-Rect struct ... +0x6/+0x8 extra fields feeding
 * func_0201e964, stride unconfirmed" -- this file resolves that gap:
 * stride is 12, pad6 = {2,0,0,0} for every member in this ROM.)
 *
 * Bytes: x=176 y=8 w=72 h=40 pad6={2,0,0,0} attr=0x0000. Section: ov014's
 * .data span 0x021b4cc0-0x021b5040 (delinks.txt) contains this address
 * -- kept non-const.
 */

typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char w;
    unsigned char h;
    unsigned char pad6[4];
    unsigned short attr;
} HitRect;

HitRect data_ov014_021b4d48 = {
    176, 8, 72, 40, {0x02, 0x00, 0x00, 0x00}, 0x0000
};
