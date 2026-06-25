/* CAMPAIGN-PREP candidate for func_020a26f0 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     unsigned clamp chain (if-assign movcc/movhi) + flag branch to fill/copy
 *   risk:       Reg-alloc of the lr=arg1 reuse + clamp ordering; unsigned compares must stay (movcc/movhi). p->f_c add scheduled mid-clamp — scheduling of the end= add may shift.
 *   confidence: med
 */
/* func_020a26f0: clamp [a1,a2) into [p->f_0, p->f_0+p->f_c) with floors/caps,
 * early-out if a1>=a2; flag!=0 -> fill(p->f_8+a1, 0, a2-a1);
 * flag==0 -> copy(p->f_4+a1, p->f_8+a1, a2-a1). All unsigned. */

typedef struct {
    unsigned int f_0;   /* 0x0  base offset */
    unsigned int f_4;   /* 0x4  src base   */
    unsigned int f_8;   /* 0x8  dst base   */
    unsigned int f_c;   /* 0xc  length     */
} region_t;

extern void func_020945f4(void *dst, int val, int len);   /* fill */
extern void func_02094688(void *src, void *dst, int n);   /* copy */

void func_020a26f0(region_t *p, unsigned int a1, unsigned int a2, int flag) {
    unsigned int base = p->f_0;
    unsigned int end  = p->f_0 + p->f_c;
    if (a1 < 0x4000) a1 = 0x4000;
    if (a2 > 0x8000) a2 = 0x8000;
    if (a1 < base) a1 = base;
    if (a2 > end)  a2 = end;
    if (a1 >= a2) return;
    if (flag != 0) {
        func_020945f4((void *)(p->f_8 + a1), 0, (int)(a2 - a1));
        return;
    }
    func_02094688((void *)(p->f_4 + a1), (void *)(p->f_8 + a1), (int)(a2 - a1));
}
