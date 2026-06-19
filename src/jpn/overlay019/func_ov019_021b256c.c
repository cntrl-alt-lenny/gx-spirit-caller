/* func_ov019_021b256c: tear down the paired scenes. Clear the mosaic nibble of
 * both DISPCNTs, run each scene's commit/teardown (func_ov019_021b2f28 /
 * func_ov019_021b48a8), stop both sound channels, and release the shared
 * engine resources. Returns 1.
 */

extern int func_ov019_021b2f28(void *a);
extern int func_ov019_021b48a8(void *a);
extern void func_02005c44(int a);
extern void func_02001b84(void);
extern void func_0202c158(void);
extern void func_0202aeec(void);
extern void func_020068fc(void);
extern char data_ov019_021b5d70[];
extern char data_ov019_021b6748[];

int func_ov019_021b256c(void) {
    *(int *)0x4000000 &= ~0x1f00;
    *(int *)0x4001000 &= ~0x1f00;
    func_ov019_021b2f28(data_ov019_021b5d70);
    func_ov019_021b48a8(data_ov019_021b6748);
    func_02005c44(1);
    func_02005c44(2);
    func_02001b84();
    func_0202c158();
    func_0202aeec();
    func_020068fc();
    return 1;
}
