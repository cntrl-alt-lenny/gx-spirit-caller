/* CAMPAIGN-PREP candidate for func_021b3f50 (ov010, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Pre-call + sparse switch w/ empty case3 + tail seq, reload global
 *   risk:       dead `cmp #3` needs the empty `case 3: break;` to emit; if mwcc folds it the trailing cmp drops
 *   confidence: high
 */
/* func_ov010_021b3f50: run func_0202af40, then per-mode dispatch on
 * data_ov010_021b8d08[+0x3c] (1->65e4, 2->8608, 3->nothing), then the
 * fixed func_02001ba4/func_02006918 tail, return 1.
 * The trailing dead `cmp r0,#3; b .L_1ac` is the empty `case 3:` (recipe #4,
 * mirrors func_ov010_021b3c58). The global is loaded once (cmp on its value).
 *
 *   bl func_0202af40
 *   ldr r0,=data_ov010_021b8d08 ; ldr r0,[r0,#0x3c]
 *   cmp r0,#1; beq .L_1a0
 *   cmp r0,#2; beq .L_1a8
 *   cmp r0,#3; b .L_1ac
 */
extern char data_ov010_021b8d08[];
extern void func_0202af40(void);
extern void func_02001ba4(void);
extern void func_02006918(void);
extern void func_ov010_021b65e4(void);
extern void func_ov010_021b8608(void);

int func_ov010_021b3f50(void) {
    func_0202af40();
    switch (*(int *)(data_ov010_021b8d08 + 0x3c)) {
    case 1: func_ov010_021b65e4(); break;
    case 2: func_ov010_021b8608(); break;
    case 3: break;
    }
    func_02001ba4();
    func_02006918();
    return 1;
}
