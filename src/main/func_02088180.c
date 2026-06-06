/* func_02088180: func_02087328(a0->f40); func_0207cff4(&tbl, a0); clear a0->f24 bit0. */
extern char data_021a5138[];
extern void func_02087328(int);
extern void func_0207cff4(void *, void *);
void func_02088180(char *a0){
    func_02087328(*(int *)(a0 + 0x40));
    func_0207cff4(data_021a5138, a0);
    *(int *)(a0 + 0x24) &= ~1;
}
