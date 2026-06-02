/* func_ov006_021c6b34: if the target index changed, retarget the channel and
 * re-arm a follow-up; return 1. */
extern int  func_02021660(int a, int b, int c);
extern int  func_020216b0(int a, int b, int c);
extern void func_020a978c(void *p, void *q, int v);
extern char data_ov006_021ce188[];
int func_ov006_021c6b34(int *obj, int idx, int flag) {
    if (idx != obj[1] || flag != 0) {
        int h;
        obj[1] = idx;
        h = func_02021660(obj[0], 3, 2);
        func_020216b0(h, 2, 41);
        func_020216b0(h, 0, 0x201);
        func_020a978c((char *)obj + 24, data_ov006_021ce188, obj[3] ? 0 : obj[1]);
    }
    return 1;
}
