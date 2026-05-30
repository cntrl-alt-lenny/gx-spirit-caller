/* func_ov002_021bc6c4: guard-then-delegate (16 band-callers). Returns -1 if
 * the func_ov002_021bc618 slot count is zero, otherwise delegates to
 * func_ov002_021bc6e8. arg0 is held across the guard call.
 */

extern int func_ov002_021bc618(int a);
extern int func_ov002_021bc6e8(int a);

int func_ov002_021bc6c4(int arg0) {
    if (func_ov002_021bc618(arg0) == 0)
        return -1;
    return func_ov002_021bc6e8(arg0);
}
