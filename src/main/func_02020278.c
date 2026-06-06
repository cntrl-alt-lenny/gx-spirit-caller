/* func_02020278: if a0->f2 set, func_0201f138(9) + func_0201f19c(a0->f2);
 * else func_0201f138(1). */
extern void func_0201f138(int);
extern void func_0201f19c(int);
void func_02020278(unsigned short *a0){
    if (a0[1]){
        func_0201f138(9);
        func_0201f19c(a0[1]);
    } else {
        func_0201f138(1);
    }
}
