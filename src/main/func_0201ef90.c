/* func_0201ef90: request dispatch (ten arguments). r points at four flags;
 * each non-zero flag runs one helper pair, the helpers take (arg, flag). */
typedef struct {
    int f0;
    int f4;
    int f8;
    int fc;
} Req;

typedef struct {
    int f0;
    int f4;
} Out;

extern void func_0207f884(int *p);
extern void func_0207f85c(int *p);
extern int func_0201ed3c(int arg0, int arg1);
extern int func_0201ed74(int arg0, int arg1);
extern int func_0201edac(int arg0, int arg1);
extern int func_0201ede4(int arg0, int arg1);
extern void func_0201f090(int *p, int a1, int *arr);
extern void func_0207f610(int a, int b, int c, int *d);
extern void func_0201ee1c(int *a, int b, int c, int *d, int e);
extern void Task_InvokeLocked(int h);

void func_0201ef90(int *a0, int *a1, int *a2, int a3, int s0, int s1, Req *r,
                   int s3, int s4, Out *out) {
    int x8;
    int x4;
    int t20[9];
    int t0c[5];
    int h;

    func_0207f884(t20);
    func_0207f85c(t0c);
    if (r->f0 != 0 && r->f4 != 0) {
        out->f0 = func_0201ed3c((int)a1, r->f0);
        out->f4 = func_0201ed74((int)a0, r->f4);
        func_0201f090((int *)*a0, *a1, a2);
    }
    if (r->f8 != 0) {
        h = func_0201edac((int)&x8, r->f8);
        func_0207f610(x8, a3, s1, t20);
        Task_InvokeLocked(h);
    }
    if (r->fc != 0) {
        h = func_0201ede4((int)&x4, r->fc);
        *(int *)(x4 + 4) = s3;
        if (s4 > 0) {
            func_0201ee1c((int *)x4, s0, s1, t0c, s4);
        }
        Task_InvokeLocked(h);
    }
}
