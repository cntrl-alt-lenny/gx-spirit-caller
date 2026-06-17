/* func_02088098: func_02087240(a0->f40); func_0207cf0c(&tbl, a0); clear a0->f24 bit0. */
extern char data_021a5058[];
extern void func_02087240(int);
extern void func_0207cf0c(void *, void *);
void func_02088098(char *a0){
    func_02087240(*(int *)(a0 + 0x40));
    func_0207cf0c(data_021a5058, a0);
    *(int *)(a0 + 0x24) &= ~1;
}
