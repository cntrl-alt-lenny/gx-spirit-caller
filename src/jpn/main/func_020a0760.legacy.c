/* func_020a0760: Style A epilogue (sub sp #4 + pop{regs,lr}+bx lr) ->
 * legacy tier. Guard-chain then a dd30-family dispatch call, matching
 * the func_0209eee0/func_0209eb00 sibling shape.
 */

extern int func_0209db3c(void);
extern void func_02092800(void *addr, int len);
extern void func_0209dd68(int idx, int b);
extern int func_0209dc3c(int a, int b, int c, int d, int e);

int func_020a0760(int a0, int a1, int a2, int a3) {
    int r;

    r = func_0209db3c();
    if (r != 0)
        return r;

    if ((unsigned int)a1 > 3)
        return 6;

    if (a1 != 0) {
        if (a3 == 0)
            return 6;
        func_02092800((void *)a3, 0x50);
    }

    func_0209dd68(0x27, a0);
    r = func_0209dc3c(0x27, 3, a1, a3, a2);
    if (r == 0)
        r = 2;
    return r;
}
