/* func_0201a110: test bit (ret-68) of the +0xa74 mask word in the shared mode
 * global. Recipe: write the AND as `(1 << n) & field` (mask first) so the
 * field lands in r0 (the return reg); `field & (1 << n)` swaps the alloc. */
extern char data_02104f4c[];
extern int func_02019210(void);

int func_0201a110(void) {
    int n = func_02019210() - 68;
    return (1 << n) & *(int *)(data_02104f4c + 0xa74);
}
