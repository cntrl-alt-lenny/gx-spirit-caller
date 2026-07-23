extern void func_0208e43c(void *reg);

void func_0208e774(void) {
    func_0208e43c((void *)0x04000400);
    while (*(volatile unsigned int *)0x04000600 & 0x8000000) {
    }
}
