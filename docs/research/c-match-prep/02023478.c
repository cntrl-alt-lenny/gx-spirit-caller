/* CAMPAIGN-PREP candidate for func_02023478 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: two-symbol+volatile dup-pool; volatile MMIO double-read; bind mode temp
 *   risk:       Dup pool word (data_0219a8dc x2): pure mwcc 2.0 CSEs to one slot+`mov` (brief-201 E-07 wall). Needs the _alias second symbol — struct-guessed/permuter-class without scaffolder alias.
 *   confidence: med
 */
/* func_02023478: conditional Task_InvokeLocked on a duplicated pool slot
 * (data_0219a8dc), then a DISPCNT read-modify-write that clears bit0 of the
 * BG-mode field, then a fixed-arg call to func_0208e5ec. Returns 1.
 *
 * Sibling of the already-matched func_02023f98 (USA/JPN) which proves the
 * two-symbol + volatile recipe for the duplicated pool word. The MMIO base
 * 0x04000000 is read TWICE (orig: two `ldr r1,[r3]; ldr r0,[r3]`), so the
 * register holding DISPCNT must be volatile to defeat load-CSE.
 *
 *     ldr r1,[REG]; ldr r0,[REG]           ; two reads of DISPCNT
 *     and r1,r1,#0x1f00; mov r2,r1,lsr#8    ; mode = (d & 0x1f00) >> 8
 *     bic r1,r0,#0x1f00                     ; d2 & ~0x1f00 (from 2nd read)
 *     bic r0,r2,#1; orr r0,r1,r0,lsl#8      ; d2 = (d2 & ~0x1f00)|((mode&~1)<<8)
 *     str r0,[REG]
 */

extern void *data_0219a8dc;        /* pool slot A (test) */
extern void *data_0219a8dc_alias;  /* pool slot B (same address, linker alias) */
extern void Task_InvokeLocked(void *p);
extern void func_0208e5ec(unsigned short a, signed short b, int c, int d, int e);

int func_02023478(void) {
    void * volatile *test_p  = (void * volatile *)&data_0219a8dc;
    void * volatile *store_p = (void * volatile *)&data_0219a8dc_alias;
    volatile unsigned int *dispcnt = (volatile unsigned int *)0x04000000;
    unsigned int mode;

    if (*test_p != 0) {
        Task_InvokeLocked(*store_p);
        *store_p = 0;
    }

    mode = (*dispcnt & 0x1f00u) >> 8;
    *dispcnt = (*dispcnt & ~0x1f00u) | ((mode & ~1u) << 8);

    func_0208e5ec(0, 0x1f, 0x7fff, 0x3f, 0);
    return 1;
}
