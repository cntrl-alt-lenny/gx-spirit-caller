/* func_02033464: minimal pass-through thunk to func_02045570. */

extern void func_02045570(void *p);

void func_02033464(void *p) {
    func_02045570(p);
}
