/* func_ov000_021adb70: if the +0x1ac flag is set, invoke the +0x174 callback. */
extern char data_ov000_021c758c[];
extern char data_ov000_021c75c4[];
void func_ov000_021adb70(void) {
    char *cb = data_ov000_021c75c4;
    if (*(int *)(data_ov000_021c758c + 428) == 0)
        return;
    (*(void (**)(void))(cb + 372))();
}
