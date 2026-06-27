/* CAMPAIGN-PREP candidate for func_021e71a4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two counted compaction loops; unsigned compares; loop1 break on c>=0x10; tail >0 flag store
 *   risk:       Orig spills the SAME base into 4 callee-saved regs (r6/r8/r9/sl) for the [+0x480]/[+0x490] reloads; mwcc from one `base` local likely uses fewer regs and reloads differently, scrambling the loop body. permuter-class.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_021e71a4 (ov002, class C) — MED tier.
 *   recipe: list-compaction; loop1 copy ce588<-ce288 capped at 0x10; loop2 shift down by i; tail flags
 * func_021e71a4(): two counted loops over 0x18-byte records in data_022ce288;
 *   [+0x480]=copied count (<=0x10), [+0x490]-=consumed, [+0x598]=(copied>0), [+0x59c]=0; return 1.
 */

extern char data_ov002_022ce288[];
extern char data_ov002_022ce588[];
extern void func_ov002_0229cd70(void *a, void *b, int n);

int func_ov002_021e71a4(void)
{
    char *base = data_ov002_022ce288;
    int i = 0;

    *(int *)(base + 0x480) = 0;

    if (*(unsigned int *)(base + 0x490) != 0) {
        char *dst = data_ov002_022ce588;
        char *src = base;
        do {
            int c;
            func_ov002_0229cd70(dst, src, 0x18);
            c = *(int *)(base + 0x480) + 1;
            *(int *)(base + 0x480) = c;
            if (c >= 0x10)
                break;
            i++;
            src += 0x18;
            dst += 0x18;
        } while ((unsigned int)i < *(unsigned int *)(base + 0x490));
    }

    if ((unsigned int)i < *(unsigned int *)(base + 0x490)) {
        if (*(unsigned int *)(base + 0x490) - i != 0) {
            char *p = base;
            int j = 0;
            do {
                func_ov002_0229cd70(p, base + (i + j) * 0x18, 0x18);
                j++;
                p += 0x18;
            } while ((unsigned int)j < *(unsigned int *)(base + 0x490) - i);
        }
    }

    *(int *)(base + 0x490) -= i;
    *(int *)(base + 0x598) = (*(int *)(base + 0x480) > 0) ? 1 : 0;
    *(int *)(base + 0x59c) = 0;
    return 1;
}
