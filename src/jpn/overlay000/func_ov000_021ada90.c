/* func_ov000_021ada90: if the +0x1ac flag is set, invoke the +0x174 callback. */
extern char data_ov000_021c74ac[];
extern char data_ov000_021c74e4[];
void func_ov000_021ada90(void) {
    char *cb = data_ov000_021c74e4;
    if (*(int *)(data_ov000_021c74ac + 428) == 0)
        return;
    (*(void (**)(void))(cb + 372))();
}
