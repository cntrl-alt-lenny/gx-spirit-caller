/* func_ov017_021b2c48: enter scene — kick the two scene controllers, enable
 * the two BGs, and run the fixed entry sequence. Returns 1.
 */

extern char data_ov017_021b8570[];
extern char data_ov017_021b8894[];
extern void func_ov017_021b30d4(void *ctrl);
extern void func_ov017_021b6f40(void *ctrl);
extern void func_02005c60(int bg);
extern void func_02001ba4(void);
extern void func_0202c1ac(void);
extern void func_0202af40(void);
extern void func_02006918(void);

int func_ov017_021b2c48(void) {
    func_ov017_021b30d4(data_ov017_021b8570);
    func_ov017_021b6f40(data_ov017_021b8894);
    func_02005c60(2);
    func_02005c60(1);
    func_02001ba4();
    func_0202c1ac();
    func_0202af40();
    func_02006918();
    return 1;
}
