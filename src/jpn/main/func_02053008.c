/* CAMPAIGN-PREP candidate for func_02053008 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two-guard then 64-bit equality of struct field vs call result
 *   risk:       func_020536b4 as long long and st.lo8 reconstructs cmp r2,r1/cmpeq r3,r0; struct shape (0x18) and the [sp+0x10] gate field are guessed.
 *   confidence: low
 */
struct S307c { long long lo8; char pad[0x10]; };

extern void func_02044c10(void *p);
extern int func_02053614(void *p);
extern long long func_020536b4(void *p);

int func_02053008(char *r4) {
    struct S307c st;
    long long v;
    if (func_02053614(r4 + 0x10) == 0) {
        return 1;
    }
    func_02044c10(&st);
    if (*(int *)((char *)&st + 0x10) == 0) {
        return 0;
    }
    v = func_020536b4(r4 + 0x10);
    return st.lo8 == v;
}
