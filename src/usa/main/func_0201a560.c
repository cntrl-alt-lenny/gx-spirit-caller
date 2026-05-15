/* func_0201a560: loop 1..26 calling func_02009a4c(i), accumulate OR.
 * Note: try i first then acc to swap register allocation.
 */

extern int func_02009a4c(int x);

int func_0201a560(void) {
    int i;
    int acc;
    acc = 0;
    for (i = 0; i < 0x1a; i++) {
        acc |= func_02009a4c(i + 1);
    }
    return acc;
}
