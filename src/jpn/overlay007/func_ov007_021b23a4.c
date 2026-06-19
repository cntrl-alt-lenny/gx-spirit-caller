/* func_ov007_021b23a4: tear down the overlay — release the two work blocks
 * (func_ov007_021b29c8 / func_ov007_021b2498), shut down the subsystem, stop
 * sound, and release the shared engine resources. Returns 1.
 */

extern void func_ov007_021b29c8(void *a);
extern void func_ov007_021b2498(void *a);
extern void func_02021064(void);
extern void func_0200ad74(void);
extern void func_0202c158(void);
extern void func_0202aeec(void);
extern void func_02001b84(void);
extern void func_020068fc(void);
extern char data_ov007_0223342c[];
extern char data_ov007_022333d0[];

int func_ov007_021b23a4(void) {
    func_ov007_021b29c8(data_ov007_0223342c);
    func_ov007_021b2498(data_ov007_022333d0);
    func_02021064();
    func_0200ad74();
    func_0202c158();
    func_0202aeec();
    func_02001b84();
    func_020068fc();
    return 1;
}
