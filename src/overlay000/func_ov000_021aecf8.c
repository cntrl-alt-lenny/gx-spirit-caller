/* func_ov000_021aecf8: return 1 if the subsystem query reports idle (0). */
extern int func_02001e5c(void *p);
extern char data_ov000_021c7770[];
int func_ov000_021aecf8(void) {
    return func_02001e5c(data_ov000_021c7770) == 0;
}
