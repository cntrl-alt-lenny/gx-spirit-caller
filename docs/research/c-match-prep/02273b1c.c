/* CAMPAIGN-PREP candidate for func_02273b1c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bit1 guard + bic-clear (&=~0xc0) + return-1 / tail-call
 *   risk:       KNOWN reg-mirror wall (brief 356/358): base reg r1-vs-r0 + single-return predication likely near-miss; route to .s
 *   confidence: low
 */
/* func_ov002_02273b1c: if bit1 of +0x16 set, clear bits6-7 of word@+0 and
 * return 1; else tail-call func_ov002_02271ab4.
 *
 *   ldrh r0,[r1,#0x16]; lsl#30; lsrs#31      ; bit1
 *   beq .L
 *     ldr r2,[r1]; mov r0,#1; bic r2,r2,#0xc0; str r2,[r1]; pop
 *   .L: bl func_ov002_02271ab4; pop
 *
 * NOTE: brief 356/358 catalogue this as a reg-mirror WALL (base in r1 not r0,
 * single-return predicate-branch) — routed to .s. C below is logically exact
 * but expected to near-miss on register colouring.
 */
typedef unsigned int u32;
typedef unsigned short u16;
struct S16 { u16 b0 : 1; u16 b1 : 1; u16 rest : 14; };            /* @0x16 */
extern char data_ov002_022cd300[];
extern int func_ov002_02271ab4(void);

int func_ov002_02273b1c(void) {
    if (((struct S16 *)(data_ov002_022cd300 + 0x16))->b1) {
        *(u32 *)data_ov002_022cd300 &= ~0xc0;
        return 1;
    }
    return func_ov002_02271ab4();
}
