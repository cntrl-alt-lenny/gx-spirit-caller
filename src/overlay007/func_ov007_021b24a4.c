/* func_ov007_021b24a4: tear down the overlay — release the two work blocks
 * (func_ov007_021b2ac8 / func_ov007_021b2598), shut down the subsystem, stop
 * sound, and release the shared engine resources. Returns 1.
 */

extern void func_ov007_021b2ac8(void *a);
extern void func_ov007_021b2598(void *a);
extern void func_020210b8(void);
extern void func_0200ad90(void);
extern void func_0202c1ac(void);
extern void func_0202af40(void);
extern void func_02001ba4(void);
extern void func_02006918(void);
extern char data_ov007_0223352c[];
extern char data_ov007_022334d0[];

int func_ov007_021b24a4(void) {
    func_ov007_021b2ac8(data_ov007_0223352c);
    func_ov007_021b2598(data_ov007_022334d0);
    func_020210b8();
    func_0200ad90();
    func_0202c1ac();
    func_0202af40();
    func_02001ba4();
    func_02006918();
    return 1;
}
