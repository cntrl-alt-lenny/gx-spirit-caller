struct s_020919ac_node {
    char pad[0x64];
    int flag;
    struct s_020919ac_node *next;
};
typedef struct s_020919ac_node Thread;
struct Scheduler {
    unsigned short pending;
    unsigned short disabled;
    Thread *current;
    Thread *first;
    void (*callback)(Thread *, Thread *);
};
extern int data_021a63bc;
extern struct Scheduler data_021a63d0;
extern Thread **data_021a63c8;
extern void (*data_021a63c4)(Thread *, Thread *);
extern struct s_020919ac_node *func_020919ac(void);
extern int func_020922d8(Thread *);
extern void func_02092324(Thread *);
/* The assembly returns the processor mode in r0, consumed here. */
extern int func_02093808(void);
void func_02091f88(void) {
    struct Scheduler *s;
    Thread *old;
    Thread *next;
    if (data_021a63bc != 0) return;
    s = &data_021a63d0;
    if (s->disabled != 0 || func_02093808() == 0x12) {
        s->pending = 1;
        return;
    }
    old = *data_021a63c8;
    next = func_020919ac();
    if (old == next) return;
    if (next == 0) return;
    if (old->flag != 2 && func_020922d8(old) != 0) return;
    if (data_021a63c4 != 0) data_021a63c4(old, next);
    if (s->callback != 0) s->callback(old, next);
    data_021a63d0.current = next;
    func_02092324(next);
}

