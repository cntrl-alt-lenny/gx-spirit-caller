/* func_02075d44: init two sub-objects — func_0207850c(a0+0x2ec) then
 * func_02077ecc(a0+0x3a4, a1, a2). Legacy 1.2/sp2p3. */
extern void func_0207850c(void *);
extern void func_02077ecc(void *, int, int);
void func_02075d44(char *a0, int a1, int a2){
    func_0207850c(a0 + 0x2ec);
    func_02077ecc(a0 + 0x3a4, a1, a2);
}
