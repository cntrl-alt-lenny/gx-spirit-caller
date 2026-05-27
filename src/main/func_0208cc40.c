/* func_0208cc40: C-41 sibling — same shape as 0208cc18, mask 0x40000000,
 * data 021a631a.
 *
 * See `func_0208cc18.c` for recipe rationale.
 */

#define DISPCNT (*(volatile unsigned int *)0x04001000)

extern int func_0208cd64(void *arg);
extern char data_021a631a[];

int func_0208cc40(void) {
    DISPCNT &= ~0x40000000;
    return func_0208cd64(data_021a631a);
}
