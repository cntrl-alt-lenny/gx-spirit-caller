/* func_02060edc: if a cached state != -1, flush it through 2 notify
 * calls, then reset it, re-init, and (conditionally) clear 3 globals. */

extern int data_02101274;
extern int data_0219e430;
extern int data_0219e434;
extern int data_0219e444;

extern void func_02045364(void);
extern void func_02054de0(int a, int b);
extern void func_02054dfc(int a);
extern void func_020604ac(void);

void func_02060edc(void)
{
    if (data_02101274 != -1) {
        func_02054de0(data_02101274, 2);
        func_02054dfc(data_02101274);
    }

    data_02101274 = -1;
    func_020604ac();

    if (data_0219e434 == 0)
        return;

    func_02045364();
    data_0219e434 = 0;
    data_0219e444 = 0;
    data_0219e430 = 0;
}
