/* func_0208cb58: C-41 sibling — same shape as 0208cc18, mask 0x40000000,
 * data 021a631a.
 *
 * See `func_0208cb30.c` for recipe rationale.
 */

#define DISPCNT (*(volatile unsigned int *)0x04001000)

extern int func_0208cc7c(void *arg);
extern char data_021a623a[];

int func_0208cb58(void) {
    DISPCNT &= ~0x40000000;
    return func_0208cc7c(data_021a623a);
}
