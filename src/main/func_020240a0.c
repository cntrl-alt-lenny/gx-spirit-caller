/* func_020240a0: identical-asm sibling of func_02021cbc — load-clear-
 * and-test. Different call-site, same shape, different .c required so
 * delinks gets a separate symbol.
 */

int func_020240a0(int *p) {
    if (*p == 0) return 0;
    *p = 0;
    return 1;
}
