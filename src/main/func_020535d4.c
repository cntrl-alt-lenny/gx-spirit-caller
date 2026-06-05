/* func_020535d4: if func_02053688(a0) == 3, set bit 2 via
 * func_0205362c(a0, func_020536a0(a0) | 4). Bind the OR to a temp so mwcc emits
 * `orr r1,r0,#4` directly (the nested-call-as-arg form adds a redundant mov). */
extern int func_02053688(int);
extern int func_020536a0(int);
extern void func_0205362c(int, int);
void func_020535d4(int a0){
    if (func_02053688(a0) == 3) {
        int v = func_020536a0(a0) | 4;
        func_0205362c(a0, v);
    }
}
