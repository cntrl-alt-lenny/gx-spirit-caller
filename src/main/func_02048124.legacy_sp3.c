typedef struct {
    void **object;
    unsigned int state;
    char pad[0x28];
    int active;
    unsigned long long tick;
} State;
extern State *data_0219dc78;
extern int func_02045280(void);
extern void func_020479ec(void);
extern void func_020480b4(int, int);
extern int func_02055fec(void **a0);
extern unsigned long long func_020930b0(void);
extern unsigned long long func_020b3808(unsigned long long, unsigned int, int);

void func_02048124(void) {
    unsigned long long diff;
    if (data_0219dc78 == 0) return;
    if (func_02045280() != 0) return;
    switch (data_0219dc78->state) {
    case 1:
        func_020479ec();
        break;
    case 2:
    case 3:
    case 4:
        if (data_0219dc78->object != 0 && *data_0219dc78->object != 0)
            func_02055fec(data_0219dc78->object);
        if (data_0219dc78->active != 0) {
            diff = (func_020930b0() - data_0219dc78->tick) << 6;
            if (func_020b3808(diff, 0x82ea, 0) > 0xea60) {
                func_020480b4(6, -0xee8e);
                data_0219dc78->active = 0;
            }
        }
        break;
    case 0:
    case 5:
        break;
    }
}
