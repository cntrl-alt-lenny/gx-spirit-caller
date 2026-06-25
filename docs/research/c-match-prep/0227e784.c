/* CAMPAIGN-PREP candidate for func_0227e784 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     unsigned counted search (bls/bcc) + :13 bitfield id compare, return i / -1
 *   risk:       reload of count each iter vs hoist; data_022cdc88 stride (4) + ptr-walk vs index; && short-circuit codegen
 *   confidence: med
 */
/* func_ov002_0227e784: linear search over data_022cdc78[+0xc] entries; for each
 * i, if func_0227e76c(i)==0 AND arg0 == 13-bit-id of data_022cdc88[i], return i.
 * Fall through -> return -1.
 *
 *   r5=&data_022cdc78; r4=arg0; ldr r0,[r5,#0xc]; cmp#0; bls .end
 *   r7=&data_022cdc88
 *   loop: r0=i(r6); bl 0227e76c; cmp#0;
 *         ldreq r0,[r7]; lsl#19; cmpeq r4,r0 lsr#19; moveq r0,i; popeq    ; match
 *         ldr r0,[r5,#0xc]; i++; cmp i,r0; r7+=4; bcc        ; unsigned
 *   end: mvn r0,#0; pop                                                   ; -1
 */
typedef unsigned int u32;
struct Hdr { char pad[0xc]; u32 count; };
struct Ent { u32 id : 13; };
extern struct Hdr data_ov002_022cdc78;
extern struct Ent data_ov002_022cdc88[];
extern int func_ov002_0227e76c(int i);

int func_ov002_0227e784(int arg0) {
    unsigned int i;
    for (i = 0; i < data_ov002_022cdc78.count; i++) {
        if (func_ov002_0227e76c(i) == 0 && arg0 == (int)data_ov002_022cdc88[i].id)
            return i;
    }
    return -1;
}
