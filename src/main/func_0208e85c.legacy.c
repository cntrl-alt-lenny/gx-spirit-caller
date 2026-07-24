extern void GXi_NopClearFifo128_(void *reg);

void func_0208e85c(void) {
    GXi_NopClearFifo128_((void *)0x04000400);
    while (*(volatile unsigned int *)0x04000600 & 0x8000000) {
    }
}
