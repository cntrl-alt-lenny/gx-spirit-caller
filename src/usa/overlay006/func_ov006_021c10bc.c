/* func_ov006_021c10bc: allocate+submit+invoke THREE fixed command records in
 * a row (0201e5b8 command-record family, same shape as func_ov006_021c73d4).
 * NOTE: ov006_core.h (brief 312 wave 5) already names this address a
 * "store-scheduling siblings 021ca678 / 021c11c8 wall (ship-as-.s)" — the
 * 3x repetition of the single-record template hits a scheduling wall the
 * one-shot form (021c74e0) doesn't. Attempted here for confirmation. */
extern int  func_02006bf0(void *p, int b, int c);
extern void func_0201d428(void *cmd);
extern void func_0201e564(void *cmd);
extern void Task_Invoke(int h);
extern char data_ov006_021cdc10[];
extern char data_ov006_021cdc28[];
extern char data_ov006_021cdc40[];

int func_ov006_021c10bc(void) {
    char cmd[40];
    int h;

    h = func_02006bf0(data_ov006_021cdc10, 4, 0);
    func_0201d428(cmd);
    *(int *)(cmd + 0) = h;
    *(unsigned short *)(cmd + 20) = (*(unsigned short *)(cmd + 20) & ~15) | 8;
    *(int *)(cmd + 8) = -1;
    *(int *)(cmd + 12) = 0x6440;
    *(short *)(cmd + 16) = 0x40;
    func_0201e564(cmd);
    Task_Invoke(h);

    h = func_02006bf0(data_ov006_021cdc28, 4, 0);
    func_0201d428(cmd);
    *(int *)(cmd + 0) = h;
    *(unsigned short *)(cmd + 20) = (*(unsigned short *)(cmd + 20) & ~15) | 8;
    *(int *)(cmd + 8) = -1;
    *(int *)(cmd + 12) = 0x6520;
    *(short *)(cmd + 16) = 0x60;
    func_0201e564(cmd);
    Task_Invoke(h);

    h = func_02006bf0(data_ov006_021cdc40, 4, 0);
    func_0201d428(cmd);
    *(int *)(cmd + 0) = h;
    *(unsigned short *)(cmd + 20) = (*(unsigned short *)(cmd + 20) & ~15) | 8;
    *(int *)(cmd + 8) = -1;
    *(int *)(cmd + 12) = 0x6720;
    *(short *)(cmd + 16) = 0x80;
    func_0201e564(cmd);
    Task_Invoke(h);

    return 1;
}
