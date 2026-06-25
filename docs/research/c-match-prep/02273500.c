/* CAMPAIGN-PREP candidate for func_02273500 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BITFIELD :8 zero-test + cond store, tail-call
 *   risk:       may emit strb/mov vs bic+orr if compiler treats :8 store differently; bx-vs-bl tail form
 *   confidence: med
 */
/* func_ov002_02273500: test low byte of +0x18 (u32); if zero set it to 0x1e,
 * store, then tail-call func_ov002_02271ab4.
 *
 *   ldr  r1,[r0,#0x18]
 *   mov  r2,r1,lsl#24 ; movs r2,r2,lsr#24      ; (u8)x, set flags
 *   biceq r1,r1,#0xff ; orreq r1,r1,#0x1e       ; if ((u8)x==0) lo=0x1e
 *   streq r1,[r0,#0x18]
 *   bx   ip (=func_ov002_02271ab4)               ; always tail-call
 */
typedef unsigned int u32;
struct S22cd300 { char pad[0x18]; u32 lo : 8; u32 hi : 24; };
extern struct S22cd300 data_ov002_022cd300;
extern void func_ov002_02271ab4(void);

void func_ov002_02273500(void) {
    if (data_ov002_022cd300.lo == 0)
        data_ov002_022cd300.lo = 0x1e;
    func_ov002_02271ab4();
}
