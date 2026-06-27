/* CAMPAIGN-PREP candidate for func_0207c5b4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D+C: constant /0xd0 -> plain unsigned '/'; strided mul index inline (i*0xd0); store-order links; cond-store insert
 *   risk:       struct-guessed/permuter-class: divide is umull 0x4ec4ec4f>>6 = /0xd0 (matchable as unsigned/0xd0). RISK: the scan uses mul r0,lr,r2 (lr=i live across, r2=0xd0 const) with add lr,#1 - mwcc may strength-reduce the i*0xd0 to a pointer-increment (add slot,#0xd0) instead of a multiply, diverging the loop body. lst->f4 vs head field offsets inferred.
 *   confidence: low
 */
/* func_0207c5b4: umull-divide bound + strided scan + list insert. returns slot or via early ret 0.
 * b=func_0207b538()+0x2000; lst=b[0x270]; r0ret=0; if(lst==0) ret 0;
 * n=b[0x274]; if(n<=0xc) ret; cnt=(n-0xc)/0xd0 (umull 0x4ec4ec4f,>>6); if(cnt==0) ret;
 * if(cnt <= lst->f0(+0x0)) ret; scan i=0.. for first slot lst+0xc+i*0xd0 with byte[slot]==0;
 * if(i>=cnt) ret; mark slot[0]=1; slot->f4=lst->f0; slot->fc=0; slot->f8=lst->f8;
 * lst->f8=slot; fixup slot->f8 prev; inc lst->f0. */
typedef struct Slot {
    int          f0;   /* used as count in list head; in slot: f4/f8/fc links */
    struct Slot *f4;   /* +0x4 */
    struct Slot *f8;   /* +0x8 */
    struct Slot *fc;   /* +0xc */
} Slot;

extern void *func_0207b538(void);

void *func_0207c5b4(void) {
    char *raw = (char *)func_0207b538() + 0x2000;
    char *lst = *(char **)(raw + 0x270);
    int   n, cnt, i;
    char *slot;
    if (lst == 0) return 0;
    n = *(int *)(raw + 0x274);
    if ((unsigned)n <= 0xc) return 0;
    cnt = (unsigned)(n - 0xc) / 0xd0;
    if (cnt == 0) return 0;
    if ((unsigned)cnt <= (unsigned)*(int *)lst) return 0;
    i = 0;
    slot = lst + 0xc;
    if (cnt > 0) {
        for (;;) {
            slot = (lst + 0xc) + i * 0xd0;
            if (*(unsigned char *)slot == 0) break;
            i++;
            if ((unsigned)i >= (unsigned)cnt) break;
        }
    }
    if ((unsigned)i >= (unsigned)cnt) return 0;
    *(unsigned char *)slot = 1;
    ((Slot *)slot)->f4 = *(Slot **)lst;        /* str r3,[r0,#4]; r3=[r1] */
    ((Slot *)slot)->fc = 0;
    ((Slot *)slot)->f8 = ((Slot *)lst)->f8;
    ((Slot *)lst)->f8 = (Slot *)slot;
    if (((Slot *)slot)->f8 != 0) ((Slot *)slot)->f8->fc = (Slot *)slot;
    else ((Slot *)lst)->f4 = (Slot *)slot;
    *(int *)lst += 1;
    return slot;
}
