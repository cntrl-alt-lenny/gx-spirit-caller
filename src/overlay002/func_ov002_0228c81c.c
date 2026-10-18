extern int data_ov002_022cd524;
extern unsigned int func_ov002_022576d8(int a);
extern void func_ov002_0228c584(int a, unsigned int b, int c, int d);

void func_ov002_0228c81c(int a, int b, int c, int d, int e)
{
    unsigned int v = func_ov002_022576d8(a);
    unsigned int bit = 1;
    v &= ~(bit << (e + (b << 4)));
    data_ov002_022cd524 = b;
    func_ov002_0228c584(b, v, c, d);
}
