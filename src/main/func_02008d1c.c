extern unsigned int data_02105bb0[][2];
extern void func_02008c10(int rec);

int func_02008d1c(int rec, int n)
{
    func_02008c10(rec);
    return (data_02105bb0[rec][n / 32] >> (n % 32)) & 1;
}
