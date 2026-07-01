extern unsigned int data_02105bb0[][2];
extern void func_02008c10(int rec);

void func_02008c84(int rec, int n, int val)
{
    unsigned int *p;

    p = data_02105bb0[rec];
    func_02008c10(rec);
    p[n / 32] = (p[n / 32] & ~(1 << (n % 32))) | (val << (n % 32));
}
