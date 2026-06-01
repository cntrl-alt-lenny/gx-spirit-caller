/* func_ov006_021b355c: per-state "finalize" — hand the state struct's +0xc
 * handle to the per-state teardown helper, run the four fixed shutdown calls,
 * then park the state word at 5 (the done state). Returns 1. 0x40 finalize
 * family, sibling of 021b2f70 (ov006_core.h). */
extern void func_ov006_021b6694(void *, int);
extern void func_02001ba4(void);
extern void func_0202c1ac(void);
extern void func_0202af40(void);
extern void func_02006918(void);
extern char data_ov006_0224f448[];
extern int  data_ov006_0224f1fc[];
int func_ov006_021b355c(void) {
    func_ov006_021b6694(data_ov006_0224f448, data_ov006_0224f1fc[3]);
    func_02001ba4();
    func_0202c1ac();
    func_0202af40();
    func_02006918();
    data_ov006_0224f1fc[0] = 5;
    return 1;
}
