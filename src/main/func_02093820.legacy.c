/* func_02093820: spin a short delay, then kick func_020903d4(1,1). STYLE-A
 * epilogue (legacy mwcc 1.2/sp2p3). */
extern void WaitByLoop(int);
extern void func_020903d4(int, int);
void func_02093820(void){
    WaitByLoop(1);
    func_020903d4(1, 1);
}
