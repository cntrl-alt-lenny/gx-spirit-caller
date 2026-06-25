/* CAMPAIGN-PREP candidate for func_020186b0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GetSystemWork leaf bit0-extract accessor (the documented `and #1` wall)
 *   risk:       GUARANTEED mismatch: `(v<<31)>>31` lowers to `and r0,#1` (1 insn), baserom is `lsl#31; movs lsr#31` (2 insn) — in-tree .s for this exact reason
 *   confidence: low
 */
/* func_020186b0: bit0 extract of state[0x8d8] from the GetSystemWork singleton.
 * THIS IS THE CANONICAL `and #1` WALL: the in-tree func_020186b0.s comment
 * states mwcc lowers `(v<<31)>>31` to `and r0,r0,#1` (one instruction) whereas
 * the baserom emits `mov r0,r0,lsl#31; movs r0,r0,lsr#31` (two). No C phrasing
 * recovers the two-instruction form; included only to document the attempt. */
extern char *GetSystemWork(void);

int func_020186b0(void) {
    return (*(unsigned int *)(GetSystemWork() + 0x8d8) << 0x1f) >> 0x1f;
}
