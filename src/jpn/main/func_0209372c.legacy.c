/* func_0209372c: spin a short delay, then kick func_020902ec(1,1). STYLE-A
 * epilogue (legacy mwcc 1.2/sp2p3). */
extern void WaitByLoop(int);
extern void func_020902ec(int, int);
void func_0209372c(void){
    WaitByLoop(1);
    func_020902ec(1, 1);
}
