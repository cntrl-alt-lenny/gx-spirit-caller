/* func_02020224: if a0->f2 set, func_0201f0e4(9) + func_0201f148(a0->f2);
 * else func_0201f0e4(1). */
extern void func_0201f0e4(int);
extern void func_0201f148(int);
void func_02020224(unsigned short *a0){
    if (a0[1]){
        func_0201f0e4(9);
        func_0201f148(a0[1]);
    } else {
        func_0201f0e4(1);
    }
}
