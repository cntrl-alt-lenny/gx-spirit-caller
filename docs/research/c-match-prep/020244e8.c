/* CAMPAIGN-PREP candidate for func_020244e8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: reload array base each iter (not bind); byte offset += 0x16c; re-read count
 *   risk:       reshape-able: orig RELOADS data_0219a8ec.array each iteration (`ldr r1,[r4,#0]` per loop) and re-reads count from [r4,#4] — if mwcc hoists/binds the base or the count, the loop body loses an ldr and diverges. Match by reading through the global each use (as written).
 *   confidence: med
 */
/* func_020244e8: iterate the data_0219a8ec slot array (count at +4, stride
 * 0x16c); for each non-null slot[0] call func_020245e8(slot). After the loop,
 * if the array base pointer (slot at +0) is non-null, Task_InvokeLocked it and
 * clear it. Returns 1.
 *
 * Manager { void *array; int count; } at data_0219a8ec. The array base is
 * reloaded each iteration (orig: `ldr r1,[r4,#0]` inside the loop), and the
 * byte offset r6 advances by 0x16c. count re-read each iter via [r4,#4].
 */

typedef struct { void *array; int count; } mgr3_0219a8ec_t;

extern mgr3_0219a8ec_t data_0219a8ec;
extern void Task_InvokeLocked(void *p);
extern void func_020245e8(void *slot);

int func_020244e8(void) {
    int i = 0;
    int off = 0;

    if (data_0219a8ec.count > 0) {
        do {
            char *slot = (char *)data_0219a8ec.array + off;
            if (*(void **)slot != 0) {
                func_020245e8(slot);
            }
            i++;
            off += 0x16c;
        } while (i < data_0219a8ec.count);
    }

    if (data_0219a8ec.array != 0) {
        Task_InvokeLocked(data_0219a8ec.array);
        data_0219a8ec.array = 0;
    }
    return 1;
}
