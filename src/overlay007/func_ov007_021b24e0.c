/* func_ov007_021b24e0: shut the overlay down and report whether both panes
 * closed cleanly. Close each pane (func_ov007_021b25a0 / func_ov007_021b2ad0),
 * tear down the subsystems, OR the saved flag into the master display control at
 * 0x4000540, and return 1 only if both close calls succeeded.
 */

extern int func_ov007_021b25a0(void *a);
extern int func_ov007_021b2ad0(void *a);
extern void func_0202111c(void);
extern void func_0200ddc4(void);
extern void func_ov007_021b2628(void *a);
extern void func_ov007_021b2b6c(void *a);
extern void func_02021158(void);
extern void func_0200e9c4(void);
extern char data_ov007_022334d0[];
extern char data_ov007_0223352c[];
extern char data_020c3e48[];
extern char data_02103da0[];

int func_ov007_021b24e0(void) {
    int a = func_ov007_021b25a0(data_ov007_022334d0);
    int b = func_ov007_021b2ad0(data_ov007_0223352c);
    func_0202111c();
    func_0200ddc4();
    func_ov007_021b2628(data_ov007_022334d0);
    func_ov007_021b2b6c(data_ov007_0223352c);
    func_02021158();
    func_0200e9c4();
    *(int *)0x4000540 = (*(int *)data_020c3e48 << 1) | *(int *)data_02103da0;
    return (a != 0 && b != 0) ? 1 : 0;
}
