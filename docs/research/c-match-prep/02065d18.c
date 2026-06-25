/* CAMPAIGN-PREP candidate for func_02065d18 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-out read + ==-1 guard + halfword load (ldrneh)
 *   risk:       buf size/offset of size slot guessed (buf 8B then size); ldrneh is unsigned u16 — confirmed
 *   confidence: med
 */
/* func_02065d18: stack out-param read helper. Pass a buffer (sp) and an
 * in/out size (=8) to func_02054c30; on -1 return 0 else return the
 * halfword at buf+2.
 *
 *   mov r3,#8; add r1,sp,#0; add r2,sp,#8; str r3,[sp,#8]
 *   bl func_02054c30
 *   if(r0 == -1) return 0; else return *(u16*)(buf+2);
 */

extern int func_02054c30(void *buf, int *size);

int func_02065d18(void) {
    unsigned char buf[8];
    int size = 8;

    if (func_02054c30(buf, &size) == -1) return 0;
    return *(unsigned short *)(buf + 2);
}
