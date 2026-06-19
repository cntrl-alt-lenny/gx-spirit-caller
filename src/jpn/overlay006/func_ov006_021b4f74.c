/* func_ov006_021b4f74: run a fixed 6-step init sequence (one ov006-local +
 * five main-arm9), set the shared state word to 8, return 1. */
extern void func_ov006_021b5e50(void *p);
extern void func_02001b84(void);
extern void func_0202c374(void);
extern void func_0202c158(void);
extern void func_0202aeec(void);
extern void func_020068fc(void);
extern int  data_ov006_0224f328[];
extern int  data_ov006_0224f210[];
int func_ov006_021b4f74(void) {
    func_ov006_021b5e50(data_ov006_0224f328);
    func_02001b84();
    func_0202c374();
    func_0202c158();
    func_0202aeec();
    func_020068fc();
    data_ov006_0224f210[0] = 8;
    return 1;
}
