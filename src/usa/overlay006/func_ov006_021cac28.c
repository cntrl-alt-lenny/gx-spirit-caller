/* func_ov006_021cac28: populate a request object's fields from six args, mark
 * it active, then build/submit/post it; return 1. */
extern void func_020060f4(void *a, void *b);
extern void func_ov006_021cad18(int *obj);
extern void func_ov006_021cacbc(int *obj, int x);
extern void func_020221e0(int a, int b);
int func_ov006_021cac28(int *obj, int a1, int a2, int a3, int a4, int a5) {
    obj[4] = a1;
    obj[5] = a2;
    obj[6] = a3;
    obj[7] = a4;
    obj[8] = a5;
    obj[2] = 1;
    obj[3] = 1;
    func_020060f4(&obj[9], &obj[10]);
    func_ov006_021cad18(obj);
    func_ov006_021cacbc(obj, 1);
    func_020221e0(6, 0);
    func_020221e0(7, 0);
    return 1;
}
