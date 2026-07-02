/* CAMPAIGN-PREP candidate for func_0200b0c8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-guard + counted loop (RELOAD arr base each iter) + tail invokes
 *   risk:       count read once before loop vs re-read; relies on p->arr[i] reloading f4 each iteration
 *   confidence: med
 */
/* func_0200b0c8 — counted loop invoking tasks from an array, then two tail invokes; returns 1.
   arr base (f4) is RELOADED each iteration -> keep p->arr[i] inline (do not hoist). */

extern void Task_InvokeLocked(void *t);

typedef struct {
    int    count;   /* 0x0 (signed: ble guard) */
    void **arr;     /* 0x4 */
} List;

int func_0200b0c8(List *p)
{
    int i;

    if (p) {
        int count = p->count;
        i = 0;

        if (count > 0) {
            do {
                void *t = p->arr[i];
                if (t)
                    Task_InvokeLocked(t);
                i++;
            } while (i < count);
        }
        Task_InvokeLocked((void *)p->arr);
        Task_InvokeLocked((void *)p);
        return 1;
    }
    return 0;
}
