/* CAMPAIGN-PREP candidate for func_021afffc (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Linear table search, signed >>8 compare, store index/-1 to globals
 *   risk:       Table base split 0x400+0x10 vs flat 0x410 may change addr-gen; reloading data base each store vs binding once.
 *   confidence: med
 */
/* func_ov002_021afffc: linear search of the u16 table at data+0x410 (stride 2),
 * comparing key to (entry >> 8) signed. On match store the index at data+0x8;
 * if none found store -1. Count at data+0xc, unsigned.
 *
 *     ldr r2,=data; mov r3,#0; ldr ip,[r2,#0xc]; cmp ip,#0; bls notfound
 *     loop: add r1,r2,r3,lsl#1; add r1,#0x400; ldrh r1,[r1,#0x10]
 *           cmp r0, r1 asr #8; streq r3,[..,#0x8]; bxeq
 *           add r3; cmp r3,ip; bcc loop
 *     notfound: mvn r1,#0; str r1,[..,#0x8]
 */

extern char data_ov002_022cdc78[];

void func_ov002_021afffc(int key) {
    unsigned short *tbl = (unsigned short *)(data_ov002_022cdc78 + 0x410);
    unsigned int i;
    for (i = 0; i < *(unsigned int *)(data_ov002_022cdc78 + 0xc); i++) {
        if (key == ((int)tbl[i] >> 8)) {
            *(int *)(data_ov002_022cdc78 + 0x8) = (int)i;
            return;
        }
    }
    *(int *)(data_ov002_022cdc78 + 0x8) = -1;
}
