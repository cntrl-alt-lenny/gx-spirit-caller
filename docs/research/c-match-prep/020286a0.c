/* CAMPAIGN-PREP candidate for func_020286a0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: reload base+count inside loop (r4=&data held), byte off+=0x19c, fan-out in source order.
 *   risk:       reshape-able: orig holds r4=&data across the whole body and RELOADS base ([r4,#0]) and count ([r4,#4]) every iter; if mwcc hoists base/count out of the loop the per-iter ldr count differs (this is why the twin shipped as .s).
 *   confidence: low
 */
/* func_020286a0: driver over pool data_0219a92c (stride 0x19c). For each of
 * count entries with [base+off]!=0, call func_02028804(base+off). Then if
 * base!=0: Task_InvokeLocked(); base=0. Then if func_020211a4(0): call the
 * func_02005ca0/e20/c60 fan-out for ids 1,2. Return 1. Twin of 02027048. */

extern void Task_InvokeLocked(void);
extern void func_02005c60(int id);
extern void func_02005ca0(int id);
extern void func_02005e20(int id);
extern int  func_020211a4(int a);
extern void func_02028804(void *entry);
extern char data_0219a92c[];

struct Pool { char *base; int count; };

int func_020286a0(void) {
    struct Pool *p = (struct Pool *)data_0219a92c;
    int i = 0;
    if (p->count > 0) {
        int off = 0;
        do {
            char *base = p->base;
            if (*(int *)(base + off) != 0) {
                func_02028804(base + off);
            }
            i++;
            off += 0x19c;
        } while (i < p->count);
    }
    if (p->base != 0) {
        Task_InvokeLocked();
        p->base = 0;
    }
    if (func_020211a4(0) != 0) {
        func_02005ca0(1);
        func_02005ca0(2);
        func_02005e20(1);
        func_02005e20(2);
        func_02005c60(1);
        func_02005c60(2);
    }
    return 1;
}
