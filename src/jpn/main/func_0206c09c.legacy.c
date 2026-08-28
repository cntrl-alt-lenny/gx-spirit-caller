/* func_0206c09c: result = arg0 + func_0206c24c(arg2); populates arg1
 * via func_0209252c/func_0209275c, dispatches a timed worker via
 * func_02091c3c (same 6-arg shape as func_02037968.c's established
 * signature) with a func_0206bd00 callback, pokes func_020918f0, and
 * returns the computed pointer.
 */

typedef struct {
    unsigned short f0;
    unsigned char f2;
    unsigned char f3;
} Arg2Struct0206c110;

extern int func_0206c24c(unsigned char *a0);
extern void func_0209252c(void *p, int a1, int a2);
extern void func_0209275c(void *p);
extern void func_02091c3c(void *obj, void (*cb)(void), int z, int sum, int b, int c);
extern void func_020918f0(void *p);
extern void func_0206bd00(void);

void *func_0206c09c(void *arg0, void *arg1, Arg2Struct0206c110 *arg2) {
    void *result;

    result = (char *)arg0 + func_0206c24c((unsigned char *)arg2);

    func_0209252c(arg1, (int)arg0, arg2->f3);

    func_0209275c((char *)arg1 + 0xe0);

    func_02091c3c((char *)arg1 + 0x20, func_0206bd00, (int)arg1, (int)result,
                  arg2->f0, arg2->f2);

    func_020918f0((char *)arg1 + 0x20);

    return result;
}
