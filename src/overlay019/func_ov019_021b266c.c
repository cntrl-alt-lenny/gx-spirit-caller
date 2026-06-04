/* func_ov019_021b266c: tear down the paired scenes. Clear the mosaic nibble of
 * both DISPCNTs, run each scene's commit/teardown (func_ov019_021b3028 /
 * func_ov019_021b49bc), stop both sound channels, and release the shared
 * engine resources. Returns 1.
 */

extern int func_ov019_021b3028(void *a);
extern int func_ov019_021b49bc(void *a);
extern void func_02005c60(int a);
extern void func_02001ba4(void);
extern void func_0202c1ac(void);
extern void func_0202af40(void);
extern void func_02006918(void);
extern char data_ov019_021b5e70[];
extern char data_ov019_021b6848[];

int func_ov019_021b266c(void) {
    *(int *)0x4000000 &= ~0x1f00;
    *(int *)0x4001000 &= ~0x1f00;
    func_ov019_021b3028(data_ov019_021b5e70);
    func_ov019_021b49bc(data_ov019_021b6848);
    func_02005c60(1);
    func_02005c60(2);
    func_02001ba4();
    func_0202c1ac();
    func_0202af40();
    func_02006918();
    return 1;
}
