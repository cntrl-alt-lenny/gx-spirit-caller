/* CAMPAIGN-PREP candidate for func_0203d6c4 (main, class D) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BITFIELD :2 extract (lsl;lsr) + cond-move select (if-assign)
 *   risk:       cls-D: u8 :2 bitfield may emit `ldrb;and #3` instead of lsl#30;lsr#30; if so retry with u32 :2 storage; cond-move vs branch on the select.
 *   confidence: low
 */
/* func_0203d6c4: read the low 2-bit field at byte 0xd0b; return
 * 0x30000 if it equals 1, else 0x20000.
 *   ldrb [r0,#0xd0b]; lsl#0x1e; lsr#0x1e; cmp #1; moveq/movne
 * The lsl#30;lsr#30 pair is a 2-bit unsigned bitfield (a plain mask
 * would fold to `and #3`).
 */
typedef struct { unsigned char v : 2; } Bf2_d0b;

int func_0203d6c4(char *p)
{
    int r;
    if (((Bf2_d0b *)(p + 0xd0b))->v == 1)
        r = 0x30000;
    else
        r = 0x20000;
    return r;
}
