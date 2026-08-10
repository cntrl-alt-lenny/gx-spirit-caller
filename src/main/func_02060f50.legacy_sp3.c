/* func_02060f50: if a cached state != -1, flush it through 2 notify
 * calls, then reset it, re-init, and (conditionally) clear 3 globals. */

extern int data_02101354;
extern int data_0219e510;
extern int data_0219e514;
extern int data_0219e524;

extern void func_020453b4(void);
extern void func_02054e54(int a, int b);
extern void func_02054e70(int a);
extern void func_02060520(void);

void func_02060f50(void)
{
    if (data_02101354 != -1) {
        func_02054e54(data_02101354, 2);
        func_02054e70(data_02101354);
    }

    data_02101354 = -1;
    func_02060520();

    if (data_0219e514 == 0)
        return;

    func_020453b4();
    data_0219e514 = 0;
    data_0219e524 = 0;
    data_0219e510 = 0;
}
