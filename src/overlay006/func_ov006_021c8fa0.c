/* func_ov006_021c8fa0: open a channel and program 6 attributes (two scaled
 * from object fields); return 1. */
extern int func_02021660(int a, int b, int c);
extern int func_020216b0(int a, int b, int c);
int func_ov006_021c8fa0(int *obj) {
    int h = func_02021660(obj[0], 5, 0);
    func_020216b0(h, 3, obj[34] + 9 + obj[32] * 20);
    func_020216b0(h, 4, obj[35] + 9 + obj[33] * 20);
    func_020216b0(h, 17, 0);
    func_020216b0(h, 18, 0);
    func_020216b0(h, 0, 233);
    return 1;
}
