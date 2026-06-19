/* func_ov006_021b8b50: lazily initialise the two handle slots at base+0xca88 /
 * +0xca8c via the main-arm9 factory; return 1. */
extern int  func_02006bf0(void *p, int b, int c);
extern char data_ov006_021cbdc0[];
extern char data_ov006_021cbdd8[];
int func_ov006_021b8b50(char *base) {
    if (*(int *)(base + 0xca88) == 0)
        *(int *)(base + 0xca88) = func_02006bf0(data_ov006_021cbdc0, 4, 0);
    if (*(int *)(base + 0xca8c) == 0)
        *(int *)(base + 0xca8c) = func_02006bf0(data_ov006_021cbdd8, 4, 0);
    return 1;
}
