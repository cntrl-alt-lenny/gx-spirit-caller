/* func_0209b1e0: bail 1 if func_0209b4e4() is 0. Otherwise clear
 * data_021a83d0, kick off func_0209adb4(0x03006000), busy-wait on
 * data_021a83d0 becoming nonzero, clear both data_021a83d0 and
 * data_021a83d4, run func_0209aa84(0,2,0,0), then send two packed
 * command words built from a0/a1 via func_0209adb4. */

extern int func_0209b4e4(void);
extern void func_0209adb4(unsigned int cmd);
extern void func_0209aa84(int a0, int a1, int a2, int a3);

extern volatile int data_021a83d0;
extern volatile int data_021a83d4;

int func_0209b1e0(int a0, int a1) {
    if (func_0209b4e4() == 0) {
        return 1;
    }

    data_021a83d0 = 0;
    func_0209adb4(0x03006000);

    while (data_021a83d0 == 0) {
    }
    data_021a83d0 = 0;
    data_021a83d4 = 0;
    func_0209aa84(0, 2, 0, 0);

    func_0209adb4((a0 & 0xff) | 0x02006100);
    func_0209adb4((a1 & 0xffff) | 0x01010000);
    return 0;
}
