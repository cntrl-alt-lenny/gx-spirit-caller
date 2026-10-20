typedef struct {
    unsigned char active, mode, flag, pad;
    int value, count, state;
    unsigned long long start, tick;
} Timer;
extern Timer *data_0219dc84;
extern unsigned char data_0219dc8c[];
extern void *func_020498f0(void);
/* The existing void definition drops the allocator result used here in r0. */
extern void *func_020454cc(int arg0, int arg1);
extern unsigned long long func_020930b0(void);
int func_0205190c(int mode, void *arg) {
    Timer *p = arg;
    if (func_020498f0() == 0) return 1;
    if (p == 0) return 3;
    switch (mode) {
    case 0:
        if (*(int *)((char *)func_020498f0() + 0x1a0) == 0x13) return 1;
        if (p->active != 0 && p->mode <= 1) return 3;
        if (data_0219dc84 == 0) {
            data_0219dc84 = func_020454cc(4, 0x20);
            if (data_0219dc84 == 0) return 4;
        }
        data_0219dc84->active = p->active;
        data_0219dc84->mode = p->mode;
        data_0219dc84->flag = 0;
        data_0219dc84->pad = 0;
        data_0219dc84->value = p->value;
        data_0219dc84->count = 0;
        data_0219dc84->state = 0;
        data_0219dc84->start = func_020930b0();
        data_0219dc84->tick = func_020930b0();
        return 0;
    case 1:
        if (*(int *)p != 0) data_0219dc8c[0] = 1;
        else data_0219dc8c[0] = 0;
        data_0219dc8c[1] = 0;
        return 0;
    default:
        return 2;
    }
}

