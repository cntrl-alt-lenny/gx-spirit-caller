/* func_020740c4: tear down: run func_02074134, release the two lock objects
 * and clear the three state words. */
extern char data_0219f0b8[];
extern char data_0219f178[];
extern int data_0219ef20;
extern int data_0219ef24;
extern int data_0219ef28;
extern void func_02074134(void);
extern void func_02091af4(void *p);
extern void func_02091b5c(void *p);
extern void func_02074498(int a);

void func_020740c4(void) {
    func_02074134();
    func_02091af4(data_0219f0b8);
    func_02091b5c(data_0219f178);
    data_0219ef20 = 0;
    func_02074498(0);
    data_0219ef24 = 0;
    data_0219ef28 = 0;
}
