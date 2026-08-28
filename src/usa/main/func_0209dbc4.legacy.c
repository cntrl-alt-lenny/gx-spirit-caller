/* func_0209dbc4: looks up a0 via func_0209dcf4 (returns char* per
 * its existing definition in func_0209dcf4.c-style callers); bails
 * with 8 if not found. Otherwise refreshes/registers it via 3
 * helpers and reports 8 or 2 depending on the last helper's sign. */

extern char *func_0209dcf4(int key);
extern void func_02094688(void *dst, unsigned int src, unsigned int len);
extern void func_02092800(void *rec, int x);
extern int func_02096264(int a, int b, int c);
extern void func_02092484(void *a, void *b, int c);
extern int data_021a8c50;

int func_0209dbc4(int a0, int a1) {
    char *result = func_0209dcf4(a0);
    int r;

    if (result == 0) {
        return 8;
    }

    func_02094688((void *)a0, (unsigned int)result, (unsigned int)a1);
    func_02092800(result, a1);
    r = func_02096264(0xa, (int)result, 0);
    func_02092484(&data_021a8c50, result, 1);

    return (r < 0) ? 8 : 2;
}
