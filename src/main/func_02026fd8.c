/* E-08 stub for brief 198 permuter wave — clone of E-07 with
 * different constant (#0xe0 = 224) and different data symbol.
 */

typedef struct {
    void *handle;
    int saved_arg;
} state_t;

extern state_t data_0219a924;
extern void Fill32(int value, void *dest, int size);
extern void *Task_PostLocked(int size, int prio, int flags);

int func_02026fd8(int arg0) {
    state_t *p = &data_0219a924;
    Fill32(0, p, 8);
    p->saved_arg = arg0;
    if (p->handle == 0) {
        int size = p->saved_arg * 0xe0;
        p->handle = Task_PostLocked(size, 4, 0);
        Fill32(0, p->handle, size);
    }
    return 1;
}
