/* func_ov007_021b23e0: shut the overlay down and report whether both panes
 * closed cleanly. Close each pane (func_ov007_021b24a0 / func_ov007_021b29d0),
 * tear down the subsystems, OR the saved flag into the master display control at
 * 0x4000540, and return 1 only if both close calls succeeded.
 */

extern int func_ov007_021b24a0(void *a);
extern int func_ov007_021b29d0(void *a);
extern void func_020210c8(void);
extern void func_0200dda8(void);
extern void func_ov007_021b2528(void *a);
extern void func_ov007_021b2a6c(void *a);
extern void func_02021104(void);
extern void func_0200e9a8(void);
extern char data_ov007_022333d0[];
extern char data_ov007_0223342c[];
extern char data_020c3d68[];
extern char data_02103cc0[];

int func_ov007_021b23e0(void) {
    int a = func_ov007_021b24a0(data_ov007_022333d0);
    int b = func_ov007_021b29d0(data_ov007_0223342c);
    func_020210c8();
    func_0200dda8();
    func_ov007_021b2528(data_ov007_022333d0);
    func_ov007_021b2a6c(data_ov007_0223342c);
    func_02021104();
    func_0200e9a8();
    *(int *)0x4000540 = (*(int *)data_020c3d68 << 1) | *(int *)data_02103cc0;
    return (a != 0 && b != 0) ? 1 : 0;
}
