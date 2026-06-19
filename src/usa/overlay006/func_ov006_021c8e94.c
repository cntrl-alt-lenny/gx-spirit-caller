/* func_ov006_021c8e94: open a channel and program 6 attributes (two scaled
 * from object fields); return 1. */
extern int func_0202160c(int a, int b, int c);
extern int func_0202165c(int a, int b, int c);
int func_ov006_021c8e94(int *obj) {
    int h = func_0202160c(obj[0], 5, 0);
    func_0202165c(h, 3, obj[34] + 9 + obj[32] * 20);
    func_0202165c(h, 4, obj[35] + 9 + obj[33] * 20);
    func_0202165c(h, 17, 0);
    func_0202165c(h, 18, 0);
    func_0202165c(h, 0, 233);
    return 1;
}
