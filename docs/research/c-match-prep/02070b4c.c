/* CAMPAIGN-PREP candidate for func_02070b4c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IRQ enter/exit bracket; poll-loop status read; out-param store + field return
 *   risk:       loop reg-alloc (r4=0,r5=3 hoisted) may flip; while-head vs do-shape; f4/f40/f44 offsets and padding guessed
 *   confidence: med
 */
/* func_02070b4c (main, class A): IRQ-bracketed spin until a status
 * field (+0x44) becomes nonzero, writing a command (+0x4) and pumping a
 * worker each iteration. Saves {r4-r9,lr}+4.
 *
 *   saved = OS_DisableIrq();
 *   while ((s = h->f44) == 0) {        first read before loop body
 *       h->f4 = 3;
 *       func_02091a8c(0);
 *   }
 *   OS_RestoreIrq(saved);
 *   *out = s;                          out = r9 = original r0
 *   return h->f40;
 *
 * h = r8 = arg1, out = r9 = arg0. r7 holds the polled status (stored to
 * *out after restore), r6 the saved mask, r5=3 (command), r4=0 (worker
 * arg). The initial read of f44 gates entry; the loop re-reads after
 * each pump. The command write `str r5,[r8,#4]` happens inside the loop
 * before the worker call.
 */

struct Hw02070b4c {
    char _pad[0x4];
    int  f4;            /* +0x4 command */
    char _pad2[0x38];
    int  f40;           /* +0x40 result */
    int  f44;           /* +0x44 status */
};

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_02091a8c(int a);

int func_02070b4c(int *out, struct Hw02070b4c *h)
{
    int saved = OS_DisableIrq();
    int status;

    while ((status = h->f44) == 0) {
        h->f4 = 3;
        func_02091a8c(0);
    }

    OS_RestoreIrq(saved);
    *out = status;
    return h->f40;
}
