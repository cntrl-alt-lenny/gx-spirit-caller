/* func_0209ada4: kick off func_02093720(0x996a00); if func_0209a954()
 * doesn't report 1, fetch 2 flags via func_0209acf0 and fire
 * func_0209ae54 for each set flag, then spin re-kicking
 * func_02093720(0x996a00) until func_0209a970(1) reports nonzero.
 * Always finishes with func_0209b078(0xe, param0, param1). */

extern void func_02093720(int a);
extern int func_0209a954(void);
extern int func_0209a970(int a);
extern void func_0209acf0(int *out1, int *out2);
extern void func_0209ae54(int a, int b);
extern void func_0209b078(int a, void *b, void *c);

void func_0209ada4(void *param0, void *param1)
{
    int local0, local1;

    func_02093720(0x996a00);

    if (func_0209a954() != 1) {
        func_0209acf0(&local0, &local1);

        if (local0 != 0)
            func_0209ae54(0, 0);

        if (local1 != 0)
            func_0209ae54(1, 0);

        if (func_0209a970(1) == 0) {
            do {
                func_02093720(0x996a00);
            } while (func_0209a970(1) == 0);
        }
    }

    func_0209b078(0xe, param0, param1);
}
