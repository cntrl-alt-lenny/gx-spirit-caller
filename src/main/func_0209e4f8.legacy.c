/* func_0209e4f8: StyleA -> dc8c() ? 0x8000 : *(u16*)0x027ffcfa. */
extern int func_0209dc8c(void);
int func_0209e4f8(void) {
    int r = func_0209dc8c();
    return r != 0 ? 0x8000 : *(unsigned short *)0x027ffcfa;
}
