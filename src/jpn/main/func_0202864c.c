/* func_0202864c -- C-34 re-audit (cm-parked-reaudit-2 batch B). For each
 * populated slot in the data_0219a92c_alias pool (stride 0x19c), calls
 * func_020287b0(slot); then if the pool has a buffer, releases it via
 * Task_InvokeLocked and clears the base pointer; then (same
 * func_02021150(0)-gated tail as func_02028568/func_0202873c's family)
 * kicks a few more subsystem toggles.
 *
 * Orig has two distinct pool slots for data_0219a92c_alias: slot A (`.count`,
 * its address loaded first, dereferenced once before the loop) and slot
 * B (`.base`/`.count`, its address loaded SECOND but still
 * UNCONDITIONALLY right after slot A -- held in a callee-saved register
 * for the entire rest of the function; base reloaded fresh at 3 separate
 * sites, count reloaded fresh every loop iteration after the
 * func_020287b0 call clobbers r0) -- registered-alias lever splits them,
 * reusing the data_0219a92c_alias entry added this session alongside
 * func_02028568's fix (docs/research/codegen-walls.md C-34). Both
 * pointers are materialized unconditionally up front (matching orig's
 * scheduling) rather than the alias only being referenced lazily inside
 * the `count > 0` guard.
 */

typedef struct {
    void *base;    /* +0x0 */
    int   count;   /* +0x4 */
} pool_0219a92c_t;

extern pool_0219a92c_t data_0219a84c;
extern pool_0219a92c_t data_0219a92c_alias;   /* SAME address -- see symbols.txt */
extern void func_020287b0(void *slot);
extern void Task_InvokeLocked(void *p);
extern int func_02021150(int arg0);
extern void func_02005c84(int a);
extern void func_02005e04(int a);
extern void func_02005c44(int a);

int func_0202864c(void)
{
    pool_0219a92c_t *q = &data_0219a84c;
    pool_0219a92c_t *p = &data_0219a92c_alias;
    int count = q->count;
    int i;

    i = 0;
    if (count > 0) {
        char *base;
        int off = 0;

        do {
            base = (char *)p->base;
            if (*(void **)(base + off) != 0) {
                func_020287b0(base + off);
            }
            i++;
            off += 0x19c;
        } while (i < p->count);
    }
    if (p->base != 0) {
        Task_InvokeLocked(p->base);
        p->base = 0;
    }
    if (func_02021150(0) != 0) {
        func_02005c84(1);
        func_02005c84(2);
        func_02005e04(1);
        func_02005e04(2);
        func_02005c44(1);
        func_02005c44(2);
    }
    return 1;
}
