/* func_ov011_021d2bb8: documented P-11 census member ("struct field
 * setter w/ useless-spill stack scratch") -- resisted permuter +
 * source-shape iteration in prior sessions. NOT a register-coloring
 * wall (the sm64ds "fake-dependency" lever doesn't apply here): the
 * residual is a pair of DEAD 8-byte stack-local writes that a plain
 * reconstruction gets dead-code-eliminated entirely, shrinking the
 * function below target. Qualifying the two dummy locals `volatile`
 * defeats the elimination while preserving the target's exact
 * store-interleaving order.
 */
typedef struct {
    char _0[0x20];
    void *task_handle;
    char _24[0x8];
    int f_2c;
    int f_30;
    int f_34;
    char _38[0x8];
    int f_40;
} state_t;

extern void Task_InvokeLocked(void *p);

void func_ov011_021d2bb8(state_t *p, int a, int b) {
    volatile struct { int x, y; } p1, p2;
    p->f_2c = a;
    p->f_30 = b;
    p1.x = a;
    p->f_34 &= ~1;
    p1.y = b;
    p2.x = a;
    p2.y = b;
    if (p->task_handle != 0) {
        Task_InvokeLocked(p->task_handle);
        p->task_handle = 0;
    }
    p->f_40 &= ~0x100;
}
