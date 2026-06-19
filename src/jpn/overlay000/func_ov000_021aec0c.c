/* func_ov000_021aec0c: return 1 if the subsystem query reports idle (0). */
extern int func_02001e3c(void *p);
extern char data_ov000_021c7690[];
int func_ov000_021aec0c(void) {
    return func_02001e3c(data_ov000_021c7690) == 0;
}
