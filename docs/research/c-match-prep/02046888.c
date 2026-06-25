/* CAMPAIGN-PREP candidate for func_02046888 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-guard + table scan returning entry; sp3 tier
 *   risk:       match arm must RELOAD data_0219daf4 base (ldreq twice) — writing data_0219daf4[i] not e should force it; could instead reuse e and mismatch.
 *   confidence: med
 */
/* func_02046888: guard on global pointer data_0219daec; then scan the
 * 32-entry pointer table data_0219daf4, returning the first entry e
 * whose func_02062498(e)[1] equals arg, else 0. sp3 routing.
 *
 *     ldr r1, =data_0219daec ; mov r6, r0
 *     ldr r0, [r1]; cmp r0,#0; moveq r0,#0; return   ; if(!*daec)ret0
 *     ldr r4, =data_0219daf4 ; mov r5, #0
 *  .L_24: ldr r0,[r4,r5,lsl#2]; cmp r0,#0; beq .L_48
 *         bl func_02062498; ldrb r0,[r0,#1]; cmp r6,r0
 *         ldreq r0,=data_0219daf4; ldreq r0,[r0,r5,lsl#2]; return
 *  .L_48: add r5,#1; cmp r5,#0x20; blt .L_24
 *         mov r0,#0 ; return
 *
 * Returns the matched table entry (a pointer) or 0. The guard reads
 * the data_0219daec global pointer (non-null check) before scanning. */

extern unsigned char *func_02062498(void *entry);
extern void *data_0219daec;      /* global pointer; only tested for NULL */
extern void *data_0219daf4[];

void *func_02046888(int key) {
    int i;
    if (data_0219daec == 0) return 0;
    for (i = 0; i < 0x20; i++) {
        void *e = data_0219daf4[i];
        if (e != 0) {
            if (key == (int)func_02062498(e)[1]) return data_0219daf4[i];
        }
    }
    return 0;
}
