extern unsigned int data_02105ad0[][2];
extern void func_02008bf4(int rec);

void func_02008c68(int rec, int n, int val)
{
    unsigned int *p;

    p = data_02105ad0[rec];
    func_02008bf4(rec);
    p[n / 32] = (p[n / 32] & ~(1 << (n % 32))) | (val << (n % 32));
}
