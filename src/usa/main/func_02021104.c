/* func_02021104 — C-34 re-audit. Same duplicate-pool shape as
 * func_020210c8 (data_02194260), fixed the same way: a raw literal-
 * address-cast for the immediately-dereferenced test value (proven
 * recipe, see src/main/func_0202a178.c), and the symbol reference held
 * for the later call argument -- mwcc schedules a literal-address load
 * eagerly when it feeds a compare, but defers a symbol load that's only
 * held for a later conditional use (matches func_020210c8's finding).
 * The orig has an explicit `cmp v,#0; beq done` BEFORE the
 * `cmp v,#1; cmpne v,#2; bne done` chain -- an explicit (empty) case 0
 * alongside cases 1/2 sharing a call, not a plain `v==1||v==2` guard
 * (which triggers mwcc's range-check peephole instead of the target's
 * literal chained-cmp form, per codegen-walls.md's brief-107 note).
 */

extern int data_02194260;
extern void func_020218e0(int *p);

int func_02021104(void)
{
    int *store_p = &data_02194260;
    int v = *(int *)0x02194340;

    switch (v) {
    case 0:
        break;
    case 1:
    case 2:
        func_020218e0(store_p);
        break;
    }
    return 1;
}
