/* func_02045c7c: forward to OS_SNPrintf, spilling a0/a3/a1 as the
 * 5th/6th/7th stack args (a3 also passed as the 4th register arg), then
 * call func_020aaddc(a2). a2 is the output buffer (cached in r4, used
 * as arg1 and in the 2nd call).
 */
extern char data_020ff8fc[];
extern void func_020aaddc(int a);
extern void OS_SNPrintf(int, int, void *, int, int, int, int);

void func_02045c7c(int a0, int a1, int a2, int a3) {
    OS_SNPrintf(a2, 0x1000, data_020ff8fc, a3, a0, a3, a1);
    func_020aaddc(a2);
}
