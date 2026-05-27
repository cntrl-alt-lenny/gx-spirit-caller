/* func_0208ce70: C-41 sibling — mask 0x40000000, helper func_0208cf6c,
 * data 021a631a.
 *
 * See `func_0208cc18.c` for recipe rationale.
 */

#define DISPCNT (*(volatile unsigned int *)0x04001000)

extern int func_0208cf6c(void *arg);
extern char data_021a631a[];

int func_0208ce70(void) {
    DISPCNT &= ~0x40000000;
    return func_0208cf6c(data_021a631a);
}
