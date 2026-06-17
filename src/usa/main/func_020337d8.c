/* func_020337d8: build an 8-byte local {b0=1, b1=a1, w4=a2} and pass it to
 * func_02051898(0, &local, 8, 1). */
extern void func_02051898(int, void *, int, int);
void func_020337d8(int a0, int a1, int a2){
    unsigned char local[8];
    local[1] = (unsigned char)a1;
    *(int *)(local + 4) = a2;
    local[0] = 1;
    func_02051898(0, local, 8, 1);
}
