typedef struct { unsigned short count; } state_0201ef3c_t;
extern void func_0201ef3c(state_0201ef3c_t *p, void **tasks1, void **tasks2);
extern void func_020058b4(void);
extern void Task_InvokeLocked(void *p);
extern void *data_ov014_022350e0[];
typedef struct {
    state_0201ef3c_t *state;
    int pad4;
    void *task;
    void *tasks[2];
} Entry;
typedef struct { int pad0; Entry entries[4]; } State;
int func_ov014_021b3fc4(State *p) {
    int i;
    for (i = 0; i < 4; i++) {
        func_0201ef3c(p->entries[i].state, &p->entries[i].task, p->entries[i].tasks);
        p->entries[i].tasks[0] = p->entries[i].tasks[1] = 0;
    }
    func_020058b4();
    for (i = 0; i < 2; i++) {
        if (data_ov014_022350e0[i] != 0) {
            Task_InvokeLocked(data_ov014_022350e0[i]);
        }
    }
    return 1;
}


