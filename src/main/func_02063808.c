/* func_02063808: p2==2 selects a lookup-then-dispatch path, else a
 * direct self-only dispatch. Both booleanize the callee's result. */

extern int func_020643d8(void *self);
extern unsigned int func_020644a4(unsigned char *data, int offset);
extern int func_0206429c(void *self, int value);

int func_02063808(void *self, unsigned char *p1, int p2) {
    unsigned int r;
    if (p2 == 2) goto L_110;

    return func_020643d8(self) != 0;

L_110:
    r = func_020644a4(p1, 0);
    return func_0206429c(self, r) != 0;
}
