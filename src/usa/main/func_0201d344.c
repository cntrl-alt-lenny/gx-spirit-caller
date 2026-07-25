/* CAMPAIGN-PREP candidate for func_0201d344 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Global set + reuse-address-as-arg + linear call sequence (fn-ptr args)
 *   risk:       func_020207c0 taking &data_020c5cd0 (r0 reuse) is inferred; if it takes the value, emits an ldr instead.
 *   confidence: med
 */
/* func_0201d344: straight-line init sequence.
 *   data_020c5cd0 = 1; func_020207c0(&data_020c5cd0); (r0 reused as ptr)
 *   func_0209e7dc(func_0201c95c);
 *   func_02020ad0(func_0201cf00);
 *   func_02005820(func_0201ce40);
 *   func_020203d8(0x306);
 *   func_0209275c(data_0218fdfc);
 *   func_0209275c(data_0218fe14);
 *   func_0201d028();
 */

extern int data_020c5cd0;
extern char data_0218fdfc[];
extern char data_0218fe14[];
extern void func_0201c95c(void);
extern void func_0201cf00(void);
extern void func_0201ce40(void);
extern void func_0201d028(void);
extern void func_02005820(void *fp);
extern void func_020207c0(int *p);
extern void func_02020ad0(void *fp);
extern void func_020203d8(int x);
extern void func_0209275c(void *p);
extern void func_0209e7dc(void *fp);

void func_0201d344(void) {
    data_020c5cd0 = 1;
    func_020207c0(&data_020c5cd0);
    func_0209e7dc(func_0201c95c);
    func_02020ad0(func_0201cf00);
    func_02005820(func_0201ce40);
    func_020203d8(0x306);
    func_0209275c(data_0218fdfc);
    func_0209275c(data_0218fe14);
    func_0201d028();
}
