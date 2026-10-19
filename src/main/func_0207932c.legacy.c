extern void func_02094688(void *src, void *dst, int n);
extern void func_02079640(unsigned short *q, unsigned short *a, unsigned short *b, unsigned short *r, int n, unsigned short *work);
extern void func_02079a08(void *arg0, unsigned short *arg1, unsigned short *arg2, int arg3);
extern void func_02079bbc(unsigned short *out, unsigned short *a, unsigned short *b, int capacity);
extern void func_02079d30(unsigned short *out, unsigned short *a, unsigned short *b, int capacity);
extern int func_02079ddc(unsigned short *arr, int idx);

void func_0207932c(unsigned short *out, unsigned short *a, unsigned short *b, int n, unsigned short *work)
{
    unsigned short *p1 = work + n;
    unsigned short *p2 = p1 + n;
    unsigned short *p3 = p2 + n;
    unsigned short *p4 = p3 + n;
    unsigned short *p5 = p4 + n;
    unsigned short *p6 = p5 + n;
    int bytes = n * 2;
    func_02094688(a, work, bytes);
    func_02094688(b, p2, bytes);
    *(unsigned short *)((char *)p2 + bytes) = 1;
    while (func_02079ddc(work, n) > 0) {
        func_02079640(p1, p2, work, p5, n, p6);
        func_02094688(work, p2, bytes);
        func_02094688(p5, work, bytes);
        func_02079a08(p5, p1, p3, n);
        func_02079bbc(p5, p4, p5, n);
        func_02094688(p3, p4, bytes);
        func_02094688(p5, p3, bytes);
    }
    func_02079d30(p4, p4, b, n);
    func_02079640(0, p4, b, out, n, p6);
}

