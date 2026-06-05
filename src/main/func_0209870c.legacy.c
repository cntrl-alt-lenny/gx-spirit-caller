/* func_0209870c: call func_020971b8(a0, flag) where flag = func_0209d5d4(a0)?5:0.
 * STYLE-A epilogue (legacy mwcc 1.2/sp2p3). */
extern int func_0209d5d4(int);
extern void func_020971b8(int, int);
void func_0209870c(int a0){
    func_020971b8(a0, func_0209d5d4(a0) ? 5 : 0);
}
