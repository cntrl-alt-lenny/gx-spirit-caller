extern int data_0219ef1c;
extern void func_02073738(int value);
extern void *func_02073838(int arg0);
extern void func_02091768(int duration);
void *func_020736ac(int value)
{
    unsigned int outer;
    unsigned int inner;
    for (outer = 0; outer < 8; outer++) {
        func_02073738(value);
        for (inner = 0; inner < 20; inner++) {
            void *result;
            if (data_0219ef1c == 0) return 0;
            func_02091768(100);
            result = func_02073838(value);
            if (result != 0) return result;
        }
    }
    return 0;
}
