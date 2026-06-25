/* CAMPAIGN-PREP candidate for func_021ccf8c (ov011, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     2 RMW then 2 calls then 1 RMW; reload base post-call
 *   risk:       WALL per brief 311: the post-call single RMW on +0x2ac fuses base+off into the pool vs orig reload+offset; cached-base doesn't fix. Pre-call pair may also reg-shift
 *   confidence: low
 */
/* func_ov011_021ccf8c: two field RMWs on data_ov011_021d4000, two calls,
 * then one post-call RMW (base reloaded). DOCUMENTED WALL (brief 311 /
 * ov011_core.h: "field-address pooling on a post-call single access ...
 * 021ccf8c") - the trailing [+0x2ac] RMW after the calls fuses base+offset
 * into a pooled constant instead of [base,#off]. Reload (separate base refs,
 * not one cached pointer) mirrors the orig's two _LIT0 loads, but mwcc still
 * pools -> register-rename .s / permuter target.
 *
 *   ldr r0,=data_021d4000
 *   [+0x238] = [+0x26c] - 0x80000
 *   [+0x23c] = [+0x270] - 0x60000
 *   bl 021cca04 ; bl 021cc948
 *   ldr r0,=data_021d4000
 *   [+0x2ac] &= ~0xff00000
 */
extern char data_ov011_021d4000[];
extern void func_ov011_021cca04(void);
extern void func_ov011_021cc948(void);

void func_ov011_021ccf8c(void) {
    *(int *)(data_ov011_021d4000 + 0x238) = *(int *)(data_ov011_021d4000 + 0x26c) - 0x80000;
    *(int *)(data_ov011_021d4000 + 0x23c) = *(int *)(data_ov011_021d4000 + 0x270) - 0x60000;
    func_ov011_021cca04();
    func_ov011_021cc948();
    *(int *)(data_ov011_021d4000 + 0x2ac) = *(int *)(data_ov011_021d4000 + 0x2ac) & ~0xff00000;
}
