/* Ov014_UpdatePanes: per-frame update for the two paired panes. Bail early
 * (reporting busy) if the transition lock at data_b5040+0x44 is held. Otherwise
 * advance each pane (func_ov014_021b2eec / func_ov014_021b41b8, keeping their
 * "done" flags), run their post-pass, latch the lock when BOTH are done, flush
 * both layers, and return whether both finished.
 */

extern int func_ov014_021b2eec(void *a);
extern int func_ov014_021b41b8(void *a);
extern void func_ov014_021b2908(void *a);
extern void func_ov014_021b4040(void *a);
extern void func_02005e20(int a);
extern void func_02005ca0(int a);
extern char data_ov014_021b5040[];
extern char data_ov014_02235094[];
extern char data_ov014_022350f4[];

int Ov014_UpdatePanes(void) {
    int a;
    int b;
    int done;
    if (*(int *)(data_ov014_021b5040 + 0x44) != 0) {
        return 1;
    }
    a = func_ov014_021b2eec(data_ov014_02235094);
    b = func_ov014_021b41b8(data_ov014_022350f4);
    func_ov014_021b2908(data_ov014_02235094);
    func_ov014_021b4040(data_ov014_022350f4);
    done = (a != 0 && b != 0) ? 1 : 0;
    if (done) {
        *(int *)data_ov014_021b5040 = 1;
    }
    func_02005e20(1);
    func_02005e20(2);
    func_02005ca0(1);
    func_02005ca0(2);
    return done;
}
