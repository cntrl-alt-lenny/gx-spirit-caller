/* Ov014_UpdatePanes: per-frame update for the two paired panes. Bail early
 * (reporting busy) if the transition lock at data_b5040+0x44 is held. Otherwise
 * advance each pane (func_ov014_021b2dec / func_ov014_021b40b8, keeping their
 * "done" flags), run their post-pass, latch the lock when BOTH are done, flush
 * both layers, and return whether both finished.
 */

extern int func_ov014_021b2dec(void *a);
extern int func_ov014_021b40b8(void *a);
extern void func_ov014_021b2808(void *a);
extern void func_ov014_021b3f40(void *a);
extern void func_02005e04(int a);
extern void func_02005c84(int a);
extern char data_ov014_021b4f40[];
extern char data_ov014_02234f94[];
extern char data_ov014_02234ff4[];

int Ov014_UpdatePanes(void) {
    int a;
    int b;
    int done;
    if (*(int *)(data_ov014_021b4f40 + 0x44) != 0) {
        return 1;
    }
    a = func_ov014_021b2dec(data_ov014_02234f94);
    b = func_ov014_021b40b8(data_ov014_02234ff4);
    func_ov014_021b2808(data_ov014_02234f94);
    func_ov014_021b3f40(data_ov014_02234ff4);
    done = (a != 0 && b != 0) ? 1 : 0;
    if (done) {
        *(int *)data_ov014_021b4f40 = 1;
    }
    func_02005e04(1);
    func_02005e04(2);
    func_02005c84(1);
    func_02005c84(2);
    return done;
}
