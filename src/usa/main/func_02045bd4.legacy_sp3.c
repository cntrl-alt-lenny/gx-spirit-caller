/* func_02045bd4: forward to OS_SNPrintf, spilling a0/a3/a1 as the
 * 5th/6th/7th stack args (a3 also passed as the 4th register arg), then
 * call func_020aace8(a2). a2 is the output buffer (cached in r4, used
 * as arg1 and in the 2nd call).
 */
extern char data_020ff81c[];
extern void func_020aace8(int a);
extern void OS_SNPrintf(int, int, void *, int, int, int, int);

void func_02045bd4(int a0, int a1, int a2, int a3) {
    OS_SNPrintf(a2, 0x1000, data_020ff81c, a3, a0, a3, a1);
    func_020aace8(a2);
}
