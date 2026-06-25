/* CAMPAIGN-PREP candidate for func_021aff90 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Counted loop, reload count each iter, equal/gt branch with call helpers
 *   risk:       Entry guard is unsigned ls(==0); loop bcc unsigned. r5=0 const assumed. Branch order of the eq/gt arms may swap.
 *   confidence: med
 */
/* func_ov002_021aff90: for each entry i in [0, data[0xc]), v = f78(i); if v==target
 * f4c(i,0); else if v>0 f4c(i,v-1). Count reloaded each iteration; the second
 * arg in the equal case is a constant 0 (r5 stays 0).
 *
 *     ldr r4,=data; mov r7,r0; ldr r0,[r4,#0xc]; cmp r0,#0; ldmlsia ...
 *     loop: bl f78; cmp r0,target; bne .L44; f4c(i,0); b .L54
 *     .L44: ble .L54; f4c(i, v-1)
 *     .L54: ldr count,[r4,#0xc]; add i; cmp i,count; bcc loop
 */

extern int data_ov002_022cdc78[];
extern int func_ov002_021aff78(int idx);
extern void func_ov002_021aff4c(int idx, int v);

void func_ov002_021aff90(int target) {
    unsigned int i;
    if ((unsigned int)data_ov002_022cdc78[3] == 0) return;
    for (i = 0; i < (unsigned int)data_ov002_022cdc78[3]; i++) {
        int v = func_ov002_021aff78((int)i);
        if (v == target) func_ov002_021aff4c((int)i, 0);
        else if (v > 0) func_ov002_021aff4c((int)i, v - 1);
    }
}
