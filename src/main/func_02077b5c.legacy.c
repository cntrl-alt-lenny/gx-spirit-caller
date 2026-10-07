/* func_02077b5c: now = func_0209bea0(date, time) + 0x386d4380 (a fixed epoch offset). */
extern void func_0209bc20(void *a);
extern void func_0209bb60(void *b);
extern int func_0209bea0(void *a, void *b);

int func_02077b5c(void) {
    char date[16];
    char time[12];
    func_0209bc20(date);
    func_0209bb60(time);
    return func_0209bea0(date, time) + 0x386d4380;
}
