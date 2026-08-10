/* func_0206f624: init sequence (func_02070f44/func_02070fe8/
 * func_02070f78 -- same shape as func_0206f054.legacy.c's sibling),
 * then a 4-iteration loop calling func_0206f688(func_0206fb64(), i)
 * until it returns 1 or the loop is exhausted, then func_02070f24();
 * returns 1 iff the loop broke on a match.
 */

extern void func_02070f44(void);
extern void func_02070fe8(void);
extern void func_02070f78(int a, int b, int c);
extern void func_02070f24(void);
extern int func_0206fb64(void);
extern int func_0206f688(int a, int b);

int func_0206f624(void) {
    int r5;
    int i;

    func_02070f44();
    func_02070fe8();
    func_02070f78(0x44, 0x43, -1);

    i = 0;
    do {
        r5 = func_0206f688(func_0206fb64(), i);
        if (r5 == 1) break;
        i++;
    } while (i < 4);

    func_02070f24();
    return r5 == 1 ? 1 : 0;
}
