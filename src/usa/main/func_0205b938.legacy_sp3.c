/* func_0205b938: decompose a1 into (byte,byte,u16) fields, validate via
 * func_0205b9e8, assert-log on failure, then re-check and either write
 * the fields out through 3 out-params or fall back to func_0205ff4c. */

extern int func_0205b9e8(int a0, int a1, int a2);
extern void func_020a6c60(const char *file, const char *msg, int zero, int line);
extern void func_0205ff4c(void *a0, void *a1);

extern char data_02100984[];
extern char data_02100940[];
extern char data_0210099c[];

int func_0205b938(void *a0, int a1, int *a2, int *a3, int *a4)
{
    int f1 = (a1 >> 24) & 0xff;
    int f2 = (a1 >> 16) & 0xff;
    int f3 = a1 & 0xffff;

    if (func_0205b9e8(f1, f2, f3) == 0)
        func_020a6c60(data_02100984, data_02100940, 0, 0xb7);

    if (func_0205b9e8(f1, f2, f3) == 0) {
        func_0205ff4c(a0, data_0210099c);
        return 2;
    }

    *a2 = f1;
    *a3 = f2;
    *a4 = f3;
    return 0;
}
