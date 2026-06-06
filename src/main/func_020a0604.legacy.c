/* func_020a0604: forward to func_020a037c(a0, a1, 0xffff, 2, 1) (5th arg on the
 * stack). Legacy 1.2/sp2p3. */
extern void func_020a037c(int, int, int, int, int);
void func_020a0604(int a0, int a1){
    func_020a037c(a0, a1, 0xffff, 2, 1);
}
