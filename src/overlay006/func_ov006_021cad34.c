/* func_ov006_021cad34: populate a request object's fields from six args, mark
 * it active, then build/submit/post it; return 1. */
extern void func_02006110(void *a, void *b);
extern void func_ov006_021cae24(int *obj);
extern void func_ov006_021cadc8(int *obj, int x);
extern void func_02022234(int a, int b);
int func_ov006_021cad34(int *obj, int a1, int a2, int a3, int a4, int a5) {
    obj[4] = a1;
    obj[5] = a2;
    obj[6] = a3;
    obj[7] = a4;
    obj[8] = a5;
    obj[2] = 1;
    obj[3] = 1;
    func_02006110(&obj[9], &obj[10]);
    func_ov006_021cae24(obj);
    func_ov006_021cadc8(obj, 1);
    func_02022234(6, 0);
    func_02022234(7, 0);
    return 1;
}
