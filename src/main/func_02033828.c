/* func_02033828: build an 8-byte local {b0=1, b1=a1, w4=a2} and pass it to
 * func_0205190c(0, &local, 8, 1). */
extern void func_0205190c(int, void *, int, int);
void func_02033828(int a0, int a1, int a2){
    unsigned char local[8];
    local[1] = (unsigned char)a1;
    *(int *)(local + 4) = a2;
    local[0] = 1;
    func_0205190c(0, local, 8, 1);
}
