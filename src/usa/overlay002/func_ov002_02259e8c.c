/* func_ov002_02259e8c: pool-deref + unsigned `> 3` check + helper-tail.
 *
 *     push  {r3, lr}
 *     ldr   r1, [pc, #20]
 *     ldr   r1, [r1, #0xcf8]
 *     cmp   r1, #3
 *     movhi r0, #0
 *     pophi {r3, pc}
 *     bl    helper
 *     pop   {r3, pc}
 *
 * Brief 246: rescued from brief 245's escape list. The `movhi`
 * unsigned-compare variant is NOT a new sub-shape — it's brief 242's
 * sub-shape 2 with gotcha 7 applied at the wrong arg count. Brief
 * 245 jumped to 2-arg pass-through (pool to r2, wrong). The fix is
 * 1-arg pass-through (function takes 1 arg, helper takes 1 arg) —
 * keeps r0 reserved for incoming arg, forces pool to r1.
 *
 * The unsigned comparison form comes from declaring f3320 as
 * `unsigned int` (movhi is unsigned higher). With signed int, mwcc
 * would emit `movgt` (signed greater-than) — wrong predicate.
 */
struct FuncOv00202259f74PoolStruct {
    char pad[3320];
    unsigned int f3320;
};
extern struct FuncOv00202259f74PoolStruct data_ov002_022d008c;
extern int func_ov002_02259eb0(int x);

int func_ov002_02259e8c(int x) {
    if (data_ov002_022d008c.f3320 > 3) return 0;
    return func_ov002_02259eb0(x);
}
