/* func_ov017_021b2b48: enter scene — kick the two scene controllers, enable
 * the two BGs, and run the fixed entry sequence. Returns 1.
 */

extern char data_ov017_021b8470[];
extern char data_ov017_021b8794[];
extern void func_ov017_021b2fd4(void *ctrl);
extern void func_ov017_021b6e40(void *ctrl);
extern void func_02005c44(int bg);
extern void func_02001b84(void);
extern void func_0202c158(void);
extern void func_0202aeec(void);
extern void func_020068fc(void);

int func_ov017_021b2b48(void) {
    func_ov017_021b2fd4(data_ov017_021b8470);
    func_ov017_021b6e40(data_ov017_021b8794);
    func_02005c44(2);
    func_02005c44(1);
    func_02001b84();
    func_0202c158();
    func_0202aeec();
    func_020068fc();
    return 1;
}
