/* func_02091c10: disable IRQs, then func_02091ba0(global->f4, 0). Legacy 1.2/sp2p3. */
extern char data_021a62f0[];
extern int OS_DisableIrq(void);
extern void func_02091ba0(int, int);
void func_02091c10(void){
    OS_DisableIrq();
    func_02091ba0(*(int *)(data_021a62f0 + 4), 0);
}
