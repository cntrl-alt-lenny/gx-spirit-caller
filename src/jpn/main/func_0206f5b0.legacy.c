/* func_0206f5b0: init sequence (func_02070e5c/func_02070f00/
 * func_02070e90 -- same shape as func_0206efe0.legacy.c's sibling),
 * then a 4-iteration loop calling func_0206f614(func_0206faf0(), i)
 * until it returns 1 or the loop is exhausted, then func_02070e3c();
 * returns 1 iff the loop broke on a match.
 */

extern void func_02070e5c(void);
extern void func_02070f00(void);
extern void func_02070e90(int a, int b, int c);
extern void func_02070e3c(void);
extern int func_0206faf0(void);
extern int func_0206f614(int a, int b);

int func_0206f5b0(void) {
    int r5;
    int i;

    func_02070e5c();
    func_02070f00();
    func_02070e90(0x44, 0x43, -1);

    i = 0;
    do {
        r5 = func_0206f614(func_0206faf0(), i);
        if (r5 == 1) break;
        i++;
    } while (i < 4);

    func_02070e3c();
    return r5 == 1 ? 1 : 0;
}
