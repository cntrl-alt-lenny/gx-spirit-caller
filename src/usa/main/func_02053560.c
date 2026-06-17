/* func_02053560: if func_02053614(a0) == 3, set bit 2 via
 * func_020535b8(a0, func_0205362c(a0) | 4). Bind the OR to a temp so mwcc emits
 * `orr r1,r0,#4` directly (the nested-call-as-arg form adds a redundant mov). */
extern int func_02053614(int);
extern int func_0205362c(int);
extern void func_020535b8(int, int);
void func_02053560(int a0){
    if (func_02053614(a0) == 3) {
        int v = func_0205362c(a0) | 4;
        func_020535b8(a0, v);
    }
}
