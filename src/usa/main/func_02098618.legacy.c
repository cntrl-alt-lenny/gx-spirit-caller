/* func_02098618: call func_020970c4(a0, flag) where flag = func_0209d4e0(a0)?5:0.
 * STYLE-A epilogue (legacy mwcc 1.2/sp2p3). */
extern int func_0209d4e0(int);
extern void func_020970c4(int, int);
void func_02098618(int a0){
    func_020970c4(a0, func_0209d4e0(a0) ? 5 : 0);
}
