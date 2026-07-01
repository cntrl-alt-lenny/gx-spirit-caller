extern unsigned int data_02105ad0[][2];
extern void func_02008bf4(int rec);

int func_02008d00(int rec, int n)
{
    func_02008bf4(rec);
    return (data_02105ad0[rec][n / 32] >> (n % 32)) & 1;
}
