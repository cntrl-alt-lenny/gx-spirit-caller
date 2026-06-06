/* func_02091cf8: disable IRQs, then func_02091c88(global->f4, 0). Legacy 1.2/sp2p3. */
extern char data_021a63d0[];
extern int OS_DisableIrq(void);
extern void func_02091c88(int, int);
void func_02091cf8(void){
    OS_DisableIrq();
    func_02091c88(*(int *)(data_021a63d0 + 4), 0);
}
