typedef struct {
    unsigned short count;
} state_0201ef3c_t;
extern void func_020058b4(void);
extern void Task_InvokeLocked(void *p);
extern void func_0201ef3c(state_0201ef3c_t *p, void **tasks1, void **tasks2);
extern void *data_ov016_021bb1b0[];
typedef struct {
    state_0201ef3c_t *state;
    int pad4;
    void *tasks[19];
    void *tail[2];
} Entry;
int func_ov016_021b7fbc(Entry *p) {
    int i;
    func_020058b4();
    for (i = 0; i < 5; i++, p++) {
        if (p->tail[0] != 0) {
            func_0201ef3c(p->state, p->tasks, p->tail);
            p->tail[1] = 0;
            p->tail[0] = 0;
        }
        if (data_ov016_021bb1b0[i] != 0)
            Task_InvokeLocked(data_ov016_021bb1b0[i]);
    }
    *(volatile unsigned short *)0x0400000c = (*(volatile unsigned short *)0x0400000c & 0x43) | 0x4304;
    return 1;
}
