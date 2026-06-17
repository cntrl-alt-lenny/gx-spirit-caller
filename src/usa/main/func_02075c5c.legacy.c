/* func_02075c5c: init two sub-objects — func_02078424(a0+0x2ec) then
 * func_02077de4(a0+0x3a4, a1, a2). Legacy 1.2/sp2p3. */
extern void func_02078424(void *);
extern void func_02077de4(void *, int, int);
void func_02075c5c(char *a0, int a1, int a2){
    func_02078424(a0 + 0x2ec);
    func_02077de4(a0 + 0x3a4, a1, a2);
}
