/* CAMPAIGN-PREP candidate for func_02092f18 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     context-save with mrs/msr/stmia/ip — documented; ship original .s
 *   risk:       permuter-class / .s-only: stmia {r4-r11}, mrs CPSR / msr CPSR_fsxc / mrs SPSR, sp & lr capture, and the implicit r12(ip) pointer arg are not C-expressible. No C reshape will match; campaign must escape to .s. Offsets struct-guessed besides.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02092f18 (main, class D, MED tier) — EUR .s front-load.
 * UNVERIFIED — LIKELY .s-ONLY: CPU context-save with mrs/msr CPSR+SPSR, stmia {r4-r11},
 * and an implicit r12(ip) pointer argument. This is almost certainly hand-written
 * assembly (context switch entry) and will NOT byte-match from plain C; the scaffold
 * below documents the data flow for the reviewer but the campaign should escape to .s.
 *   recipe:     CLASS D store-order documentation only; real path = ship the .s
 *   risk:       see header below
 * func_02092f18(r0): save current context into data_021a663c.
 *   ctx->x74 = CPSR; ctx->x6c = r0;
 *   ctx->x04 = ip[0]; ctx->x08 = ip[1]; ctx->x0c = ip[2]; ctx->x10 = ip[3];
 *   m = ip[4] & ~1;                 // masked frame pointer
 *   stmia &ctx->x14, {r4..r11};     // 8 callee regs
 *   ctx->x70 = ip;
 *   ctx->x64 = m[0]; ctx->x00 = m[1]; ctx->x34 = m[2]; ctx->x40 = m[3];
 *   save = CPSR; cpsr = (m[1] | 0x80) & ~0x20; msr CPSR_fsxc, cpsr;
 *   ctx->x38 = sp; ctx->x3c = lr; ctx->x7c = SPSR; msr CPSR_fsxc, save;
 * The stmia {r4-r11}, mrs/msr, sp/lr capture and the ip(r12) input are not
 * expressible in C — included only as a reading aid.
 */

typedef struct Ctx {
    int  x00; char p04[0]; int x04; int x08; int x0c; int x10;
    char p14[0x34 - 0x14];
    int  x34; char p38[0x40 - 0x38]; int x40;
    char p44[0x64 - 0x44]; int x64;
    char p68[0x6c - 0x68]; int x6c; int x70; int x74;
    char p78[0x7c - 0x78]; int x7c;
} Ctx;

extern Ctx data_021a663c;

void func_02092f18(int r0) {
    /* SCAFFOLD ONLY — see header; real implementation is the original .s. */
    (void)r0;
}
