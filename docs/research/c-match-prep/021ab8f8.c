/* CAMPAIGN-PREP candidate for func_021ab8f8 (ov020, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     param-pack + MMIO RMW + per-mode dispatch (truncated)
 *   risk:       source asm is truncated ('...(truncated)'): loop back-edge, mode>=2 dispatch, literal-pool values and epilogue are all missing — not byte-reproducible until re-extracted
 *   confidence: low
 */
/* func_ov000_021ab8f8 (ov000, B) — PARTIAL: source asm is TRUNCATED, so a
 * byte-exact full-body C cannot be produced. Reconstructed prefix only.
 * Visible body: call func_ov000_021ab798; then a per-mode (r4) loop over a
 * struct at data_ov000_021c7530 reading +0xc (a packed lo/hi byte pair) and +0x0
 * (flag bits). Mode 0 writes REG at 0x4000000, mode 1 writes a second REG
 * (_LIT1), both as `(reg & ~0x1f00) | (val<<8)` — a BLDxx/MOSAIC-style MMIO RMW.
 * Then bit 0x4000 of +0x0 is consumed (bic r0,#0x4000) and the struct value is
 * unpacked into 4 fields via lsl/lsr shift pairs, dispatched by mode to
 * func_0208e318 / func_0208e2f4 with a 5th arg pushed via str r5,[sp]. The tail
 * (loop back-edge to .L_10, remaining mode>=2 dispatch, _LIT0/1/2 values, and the
 * epilogue) is cut off in the batch JSON, so the loop bound and exact arg lists
 * are unknown. DO NOT BUILD AS-IS — re-extract the full disassembly first. */
extern unsigned char data_ov000_021c7530[];
extern void func_ov000_021ab798(void);
/* extern void func_0208e318(...); func_0208e2f4(...); func_0208c884(...); etc. */

/* INCOMPLETE — full reconstruction blocked on truncated asm. */
