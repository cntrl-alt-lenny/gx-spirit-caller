extern void func_02093dc8(int a0);
extern void func_0208d030(int a0);
extern int data_0210249c;
extern int data_021a6320;

void func_0208f2a8(void)
{
    if (data_0210249c != -1) {
        func_02093dc8(data_0210249c);
    }
    func_0208d030(data_021a6320);
    data_021a6320 = 0;
}
