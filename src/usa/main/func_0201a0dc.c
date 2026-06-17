/* func_0201a0dc: test bit (ret-68) of the +0xa74 mask word in the shared mode
 * global. Recipe: write the AND as `(1 << n) & field` (mask first) so the
 * field lands in r0 (the return reg); `field & (1 << n)` swaps the alloc. */
extern char data_02104e6c[];
extern int func_020191dc(void);

int func_0201a0dc(void) {
    int n = func_020191dc() - 68;
    return (1 << n) & *(int *)(data_02104e6c + 0xa74);
}
