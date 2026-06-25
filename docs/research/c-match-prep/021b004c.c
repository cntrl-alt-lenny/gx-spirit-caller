/* CAMPAIGN-PREP candidate for func_021b004c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Linear search returning &arr[i] / &arr[count] (fall-through one-past-end)
 *   risk:       Relies on i==count after loop for the one-past-end return; table base 0x400+0x10 split addr-gen may differ.
 *   confidence: med
 */
/* func_ov002_021b004c: like 021afffc but RETURNS a pointer into the int array
 * data_ov002_022cdc88: on match returns &arr[i]; if none found returns &arr[count]
 * (one past the end). Key compared to (u16-entry >> 8) signed.
 *
 *     ldr r2,=data78; mov r3,#0; ldr ip,[r2,#0xc]; cmp ip,#0; bls notfound
 *     loop: add r1,r2,r3,lsl#1; add r1,#0x400; ldrh r1,[r1,#0x10]
 *           cmp r0, r1 asr #8; ldreq r0,=data88; addeq r0,r0,r3,lsl#2; bxeq
 *           add r3; cmp r3,ip; bcc loop
 *     notfound: ldr r0,=data88; add r0,r0,r3,lsl#2
 */

extern char data_ov002_022cdc78[];
extern int data_ov002_022cdc88[];

int *func_ov002_021b004c(int key) {
    unsigned short *tbl = (unsigned short *)(data_ov002_022cdc78 + 0x410);
    unsigned int i;
    for (i = 0; i < *(unsigned int *)(data_ov002_022cdc78 + 0xc); i++) {
        if (key == ((int)tbl[i] >> 8))
            return &data_ov002_022cdc88[i];
    }
    return &data_ov002_022cdc88[i];
}
