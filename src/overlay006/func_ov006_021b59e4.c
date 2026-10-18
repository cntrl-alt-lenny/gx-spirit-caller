extern int func_ov006_021b5704(int);
/* This caller passes a pointer although the callee's C definition takes void. */
extern int func_ov006_021c9ed4(void *);
extern char data_ov006_0225e068[];
struct State { int state; int timer; };
extern char data_ov006_0224f398[];
extern int data_ov006_0224f38c;
int func_ov006_021b59e4(void) {
    struct State *state = (struct State *)data_ov006_0224f398;
    func_ov006_021b5704(1);
    func_ov006_021c9ed4(data_ov006_0225e068);
    state->state = 2;
    state->timer = 0x18;
    data_ov006_0224f38c = 4;
    return 1;
}
