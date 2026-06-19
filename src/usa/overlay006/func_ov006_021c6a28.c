/* func_ov006_021c6a28: if the target index changed, retarget the channel and
 * re-arm a follow-up; return 1. */
extern int  func_0202160c(int a, int b, int c);
extern int  func_0202165c(int a, int b, int c);
extern void func_020a9698(void *p, void *q, int v);
extern char data_ov006_021ce068[];
int func_ov006_021c6a28(int *obj, int idx, int flag) {
    if (idx != obj[1] || flag != 0) {
        int h;
        obj[1] = idx;
        h = func_0202160c(obj[0], 3, 2);
        func_0202165c(h, 2, 41);
        func_0202165c(h, 0, 0x201);
        func_020a9698((char *)obj + 24, data_ov006_021ce068, obj[3] ? 0 : obj[1]);
    }
    return 1;
}
