/* func_02053488: arg-shuffle forward — OS_SNPrintf(a2, 13, &table, a0, a1)
 * with a1 spilled as the 5th (stack) arg. SP3 tier (1.2/sp3). */
extern char data_020ffad0[];
extern void OS_SNPrintf(int, int, void *, int, int);
void func_02053488(int a0, int a1, int a2){
    OS_SNPrintf(a2, 13, data_020ffad0, a0, a1);
}
