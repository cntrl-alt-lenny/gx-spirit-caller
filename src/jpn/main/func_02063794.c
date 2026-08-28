/* func_02063794: p2==2 selects a lookup-then-dispatch path, else a
 * direct self-only dispatch. Both booleanize the callee's result. */

extern int func_02064364(void *self);
extern void *func_02064430(int p1, int zero);
extern int func_02064228(void *self, void *p);

int func_02063794(void *self, int p1, int p2) {
    void *r;
    if (p2 == 2) goto L_110;

    return func_02064364(self) != 0;

L_110:
    r = func_02064430(p1, 0);
    return func_02064228(self, r) != 0;
}
