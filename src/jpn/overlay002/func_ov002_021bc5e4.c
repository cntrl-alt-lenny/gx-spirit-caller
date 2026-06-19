/* func_ov002_021bc5e4: guard-then-delegate (16 band-callers). Returns -1 if
 * the func_ov002_021bc538 slot count is zero, otherwise delegates to
 * func_ov002_021bc608. arg0 is held across the guard call.
 */

extern int func_ov002_021bc538(int a);
extern int func_ov002_021bc608(int a);

int func_ov002_021bc5e4(int arg0) {
    if (func_ov002_021bc538(arg0) == 0)
        return -1;
    return func_ov002_021bc608(arg0);
}
