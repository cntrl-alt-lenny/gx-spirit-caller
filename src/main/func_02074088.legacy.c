extern int data_02101ea0;
extern char data_0219f178[], data_0219f0b8[];
extern int func_0209181c(char *a0, void *a1);
void func_02074088(void *value)
{
    data_02101ea0 = (int)value;
    func_0209181c(data_0219f178, value);
    func_0209181c(data_0219f0b8, value);
}
