/* func_0209ae98: kick off func_02093814(0x996a00); if func_0209aa48()
 * doesn't report 1, fetch 2 flags via func_0209ade4 and fire
 * func_0209af48 for each set flag, then spin re-kicking
 * func_02093814(0x996a00) until func_0209aa64(1) reports nonzero.
 * Always finishes with func_0209b16c(0xe, param0, param1). */

extern void func_02093814(int a);
extern int func_0209aa48(void);
extern int func_0209aa64(int a);
extern void func_0209ade4(int *out1, int *out2);
extern void func_0209af48(int a, int b);
extern void func_0209b16c(int a, void *b, void *c);

void func_0209ae98(void *param0, void *param1)
{
    int local0, local1;

    func_02093814(0x996a00);

    if (func_0209aa48() != 1) {
        func_0209ade4(&local0, &local1);

        if (local0 != 0)
            func_0209af48(0, 0);

        if (local1 != 0)
            func_0209af48(1, 0);

        if (func_0209aa64(1) == 0) {
            do {
                func_02093814(0x996a00);
            } while (func_0209aa64(1) == 0);
        }
    }

    func_0209b16c(0xe, param0, param1);
}
