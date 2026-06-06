/* func_02089c44: func_02089c74(a0, a2, a3); func_02094e64(a0, a0+a1). SP3 tier
 * (1.2/sp3). */
extern void func_02089c74(int, int, int);
extern void func_02094e64(int, int);
void func_02089c44(int a0, int a1, int a2, int a3){
    func_02089c74(a0, a2, a3);
    func_02094e64(a0, a0 + a1);
}
