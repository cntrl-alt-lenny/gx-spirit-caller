extern int data_0219ef1c;
extern int func_02073e68(int a);
extern int func_02073e54(unsigned int a);
int func_02073dcc(int address)
{
    int result = 1;
    int third = 1;
    int second = 1;
    int first = 1;
    if (data_0219ef1c != 0 && address != data_0219ef1c) first = 0;
    if (first == 0 && address != 0x7f000001) second = 0;
    if (second == 0 && func_02073e68(address) == 0) third = 0;
    if (third == 0 && func_02073e54(address) == 0) result = 0;
    return result;
}
