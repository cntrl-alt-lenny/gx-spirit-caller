/* CAMPAIGN-PREP candidate for func_021afbd4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     raw shift-pair for bit13 test ((x<<18)>>31) and the 13-bit return ((x<<19)>>19); guard via && + nested if; reload T[arg0]
 *   risk:       permuter-class: orig binds table base in r4 and arg0 in r5 across both branches, reloading T[r4,r5<<2] in .L_54; call uses r2=r5,r1=0xf so 3-arg sig with arg0 as 3rd -- if mwcc reorders args or rebinds r4/r5, diverges (this fn already ships as .s).
 *   confidence: low
 */
/* func_ov002_021afbd4: read T[arg0] (stride-4 word table at data_ov002_022cdc88).
 * If state data_ov002_022cdc78[1]==4 AND (T[arg0] bit13, i.e. (x<<18)>>31) ==
 * (data_ov002_022cd73c[1]^1): call func_ov002_021c988c(0xf, arg0); if it returns
 * 0, return 0. Otherwise (or on call!=0): if state==0x4a return 0, else return
 * the 13-bit field (T[arg0]<<19)>>19.
 *
 *   ldr r1,[r4,r5,lsl#2]; r1<<0x12; cmp [cdc78,#4],#4; r0=r1>>0x1f; bne .L_54
 *   ldr r1,[cd73c,#4]; eor r1,#1; cmp r0,r1; bne .L_54
 *   mov r2,r5; mov r1,#0xf; bl func_ov002_021c988c; cmp r0,#0; moveq r0,#0; ret
 * .L_54: ldr r0,[cdc78,#4]; cmp r0,#0x4a; moveq r0,#0; ldrne r0,[r4,r5,lsl#2]; movne r0,r0<<0x13>>0x13
 */

extern unsigned int data_ov002_022cdc88[];   /* T: stride-4 word table */
extern int          data_ov002_022cdc78[];   /* state[1] = +0x4    */
extern int          data_ov002_022cd73c[];   /* +0x4 flag          */
extern int          func_ov002_021c988c(int slot, int a, int b);

int func_ov002_021afbd4(int arg0) {
    unsigned int t = data_ov002_022cdc88[arg0];
    if (data_ov002_022cdc78[1] == 4 &&
        ((t << 0x12) >> 0x1f) == (unsigned)(data_ov002_022cd73c[1] ^ 1)) {
        if (func_ov002_021c988c(0xf, 0, arg0) == 0)
            return 0;
    }
    if (data_ov002_022cdc78[1] == 0x4a)
        return 0;
    return (data_ov002_022cdc88[arg0] << 0x13) >> 0x13;   /* :13 field */
}
