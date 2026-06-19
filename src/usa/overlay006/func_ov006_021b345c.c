/* func_ov006_021b345c: per-state "finalize" — hand the state struct's +0xc
 * handle to the per-state teardown helper, run the four fixed shutdown calls,
 * then park the state word at 5 (the done state). Returns 1. 0x40 finalize
 * family, sibling of 021b2f70 (ov006_core.h). */
extern void func_ov006_021b6594(void *, int);
extern void func_02001b84(void);
extern void func_0202c158(void);
extern void func_0202aeec(void);
extern void func_020068fc(void);
extern char data_ov006_0224f328[];
extern int  data_ov006_0224f0dc[];
int func_ov006_021b345c(void) {
    func_ov006_021b6594(data_ov006_0224f328, data_ov006_0224f0dc[3]);
    func_02001b84();
    func_0202c158();
    func_0202aeec();
    func_020068fc();
    data_ov006_0224f0dc[0] = 5;
    return 1;
}
