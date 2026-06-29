/* CAMPAIGN-PREP candidate for func_02046718 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     indexed table scan + call, return flag; sp3 tier
 *   risk:       table typed void*[]; if dsd extracts data_0219daf4 as char[], stride/index addressing could differ. Loop-bound 0x20 fixed.
 *   confidence: high
 */
/* func_02046718: scan the 32-entry pointer table data_0219daf4; for
 * each non-null entry e, compare arg against func_02062498(e)[1];
 * return 1 on first match, 0 if none. sp3 routing.
 *
 *     mov r6, r0 ; mov r5, #0 ; ldr r4, =data_0219daf4
 *  .L_10: ldr r0,[r4,r5,lsl#2]; cmp r0,#0; beq .L_30
 *         bl func_02062498; ldrb r0,[r0,#1]; cmp r6,r0
 *         moveq r0,#1; return
 *  .L_30: add r5,#1; cmp r5,#0x20; blt .L_10
 *         mov r0,#0; return */

extern unsigned char *func_02062498(void *entry);
extern void *data_0219daf4[];

int func_02046718(int key) {
    int i;
    for (i = 0; i < 0x20; i++) {
        void *e = data_0219daf4[i];
        if (e != 0) {
            if (key == (int)func_02062498(e)[1]) return 1;
        }
    }
    return 0;
}
