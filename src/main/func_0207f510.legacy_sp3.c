/* func_0207f510: run the transfer step selected by mode (0, 1 or 2) over
 * (h->fc, a1, h->f8), then copy h's header to out and call func_0207f850. */
typedef struct {
    int f0;
    int f4;
    int f8;
    void *fc;
} Hdr;
typedef struct {
    int f0;
    int f4;
} Out;
extern void func_02092904(void *p, int n);
extern void func_02090114(void);
extern void func_020900a0(void *p, int a, int n);
extern void func_02090048(void);
extern void func_0208f458(void);
extern void func_0208f3e4(void *p, int a, int n);
extern void func_0208f38c(void);
extern void func_0208ff1c(void *p, int a, int n);
extern void func_0208f284(void);
extern void func_0208f210(void *p, int a, int n);
extern void func_0208f1c4(void);
extern void func_0208feb4(void *p, int a, int n);
extern void func_0207f850(Out *out, int mode, int a);

void func_0207f510(Hdr *h, int a1, int mode, Out *out) {
    void *p = h->fc;
    int n = h->f8;

    func_02092904(p, n);
    switch (mode) {
    case 1:
        if (h->f4 != 0) {
            func_0208f458();
            func_0208f3e4(p, a1, n);
            func_0208f38c();
        } else {
            func_0208ff1c(p, a1, n);
        }
        break;
    case 2:
        if (h->f4 != 0) {
            func_0208f284();
            func_0208f210(p, a1, n);
            func_0208f1c4();
        } else {
            func_0208feb4(p, a1, n);
        }
        break;
    case 0:
        func_02090114();
        func_020900a0(p, a1, n);
        func_02090048();
        break;
    }
    out->f0 = h->f0;
    out->f4 = h->f4;
    func_0207f850(out, mode, a1);
}
