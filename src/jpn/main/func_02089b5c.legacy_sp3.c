/* func_02089b5c: func_02089b8c(a0, a2, a3); func_02094d70(a0, a0+a1). SP3 tier
 * (1.2/sp3). */
extern void func_02089b8c(int, int, int);
extern void func_02094d70(int, int);
void func_02089b5c(int a0, int a1, int a2, int a3){
    func_02089b8c(a0, a2, a3);
    func_02094d70(a0, a0 + a1);
}
