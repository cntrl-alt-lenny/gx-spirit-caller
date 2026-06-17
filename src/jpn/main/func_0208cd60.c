/* func_0208cd60: C-41 sibling — mask 0x80000000, helper func_0208ce84,
 * data 021a631c.
 *
 * See `func_0208cb30.c` for recipe rationale.
 */

#define DISPCNT (*(volatile unsigned int *)0x04001000)

extern int func_0208ce84(void *arg);
extern char data_021a623c[];

int func_0208cd60(void) {
    DISPCNT &= ~0x80000000;
    return func_0208ce84(data_021a623c);
}
