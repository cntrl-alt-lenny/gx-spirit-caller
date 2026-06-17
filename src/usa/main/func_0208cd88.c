/* func_0208cd88: C-41 sibling — mask 0x40000000, helper func_0208ce84,
 * data 021a631a.
 *
 * See `func_0208cb30.c` for recipe rationale.
 */

#define DISPCNT (*(volatile unsigned int *)0x04001000)

extern int func_0208ce84(void *arg);
extern char data_021a623a[];

int func_0208cd88(void) {
    DISPCNT &= ~0x40000000;
    return func_0208ce84(data_021a623a);
}
