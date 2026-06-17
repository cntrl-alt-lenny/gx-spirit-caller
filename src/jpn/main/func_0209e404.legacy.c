/* func_0209e404: StyleA -> dc8c() ? 0x8000 : *(u16*)0x027ffcfa. */
extern int func_0209db98(void);
int func_0209e404(void) {
    int r = func_0209db98();
    return r != 0 ? 0x8000 : *(unsigned short *)0x027ffcfa;
}
