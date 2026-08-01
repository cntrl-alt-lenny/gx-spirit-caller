/* func_020a0854: Style A epilogue (sub sp #4 + pop{regs,lr}+bx lr) ->
 * legacy tier. Guard-chain then a dd30-family dispatch call, matching
 * the func_0209eee0/func_0209eb00 sibling shape.
 */

extern int func_0209dc30(void);
extern void func_020928e8(void *addr, int len);
extern void func_0209de5c(int idx, int b);
extern int func_0209dd30(int a, int b, int c, int d, int e);

int func_020a0854(int a0, int a1, int a2, int a3) {
    int r;

    r = func_0209dc30();
    if (r != 0)
        return r;

    if ((unsigned int)a1 > 3)
        return 6;

    if (a1 != 0) {
        if (a3 == 0)
            return 6;
        func_020928e8((void *)a3, 0x50);
    }

    func_0209de5c(0x27, a0);
    r = func_0209dd30(0x27, 3, a1, a3, a2);
    if (r == 0)
        r = 2;
    return r;
}
