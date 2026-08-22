/* func_0209dcb8: looks up a0 via func_0209dde8 (returns char* per
 * its existing definition in func_0209dde8.c-style callers); bails
 * with 8 if not found. Otherwise refreshes/registers it via 3
 * helpers and reports 8 or 2 depending on the last helper's sign. */

extern char *func_0209dde8(int key);
extern void func_02094688(void *dst, unsigned int src, unsigned int len);
extern void func_020928e8(void *rec, int x);
extern int func_02096358(int a, int b, int c);
extern void func_0209256c(void *a, void *b, int c);
extern int data_021a8d30;

int func_0209dcb8(int a0, int a1) {
    char *result = func_0209dde8(a0);
    int r;

    if (result == 0) {
        return 8;
    }

    func_02094688((void *)a0, (unsigned int)result, (unsigned int)a1);
    func_020928e8(result, a1);
    r = func_02096358(0xa, (int)result, 0);
    func_0209256c(&data_021a8d30, result, 1);

    return (r < 0) ? 8 : 2;
}
