/* func_0206c110: result = arg0 + func_0206c2c0(arg2); populates arg1
 * via func_02092614/func_02092844, dispatches a timed worker via
 * func_02091d24 (same 6-arg shape as func_02037968.c's established
 * signature) with a func_0206bd74 callback, pokes func_020919d8, and
 * returns the computed pointer.
 */

typedef struct {
    unsigned short f0;
    unsigned char f2;
    unsigned char f3;
} Arg2Struct0206c110;

extern int func_0206c2c0(unsigned char *a0);
extern void func_02092614(void *p, int a1, int a2);
extern void func_02092844(void *p);
extern void func_02091d24(void *obj, void (*cb)(void), int z, int sum, int b, int c);
extern void func_020919d8(void *p);
extern void func_0206bd74(void);

void *func_0206c110(void *arg0, void *arg1, Arg2Struct0206c110 *arg2) {
    void *result;

    result = (char *)arg0 + func_0206c2c0((unsigned char *)arg2);

    func_02092614(arg1, (int)arg0, arg2->f3);

    func_02092844((char *)arg1 + 0xe0);

    func_02091d24((char *)arg1 + 0x20, func_0206bd74, (int)arg1, (int)result,
                  arg2->f0, arg2->f2);

    func_020919d8((char *)arg1 + 0x20);

    return result;
}
