/* func_0208ce48: C-41 sibling — mask 0x80000000, helper func_0208cf6c,
 * data 021a631c.
 *
 * See `func_0208cc18.c` for recipe rationale.
 */

#define DISPCNT (*(volatile unsigned int *)0x04001000)

extern int func_0208cf6c(void *arg);
extern char data_021a631c[];

int func_0208ce48(void) {
    DISPCNT &= ~0x80000000;
    return func_0208cf6c(data_021a631c);
}
