/* func_ov006_021b5074: run a fixed 6-step init sequence (one ov006-local +
 * five main-arm9), set the shared state word to 8, return 1. */
extern void func_ov006_021b5f50(void *p);
extern void func_02001ba4(void);
extern void func_0202c3c8(void);
extern void func_0202c1ac(void);
extern void func_0202af40(void);
extern void func_02006918(void);
extern int  data_ov006_0224f448[];
extern int  data_ov006_0224f330[];
int func_ov006_021b5074(void) {
    func_ov006_021b5f50(data_ov006_0224f448);
    func_02001ba4();
    func_0202c3c8();
    func_0202c1ac();
    func_0202af40();
    func_02006918();
    data_ov006_0224f330[0] = 8;
    return 1;
}
