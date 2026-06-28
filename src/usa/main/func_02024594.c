/* CAMPAIGN-PREP candidate for func_02024594 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Null-guard + single-bit (bitfield) test + two-way dispatch
 *   risk:       bit-2 extract may emit lsr#2;and#1 instead of lsl#29;lsr#31 unless a :1 bitfield is used; callee arg may need mov r0,r4
 *   confidence: med
 */
/* func_02024594: null-guard on *p; then test bit 2 of the u16 flags
 * at p+0x16a. bit set -> func_020259bc(p), else func_0202649c(p);
 * then clear *p, return 1. (h<<29)>>31 isolates bit 2, matching
 * the func_02018b24 single-bit extract idiom; the +0x100/+0x6a
 * address split is forced (0x16a exceeds the ldrh imm range). */
extern void func_020259bc(void *p);
extern void func_0202649c(void *p);

int func_02024594(void *p) {
    unsigned short h;
    if (*(int *)p == 0) return 0;
    h = *(unsigned short *)((char *)p + 0x16a);
    if ((unsigned)(h << 29) >> 31) {
        func_020259bc(p);
    } else {
        func_0202649c(p);
    }
    *(int *)p = 0;
    return 1;
}
