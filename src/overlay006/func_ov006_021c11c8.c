/* func_ov006_021c11c8: allocate+submit+invoke THREE fixed command records in
 * a row (0201e5b8 command-record family, same shape as func_ov006_021c74e0).
 * NOTE: ov006_core.h (brief 312 wave 5) already names this address a
 * "store-scheduling siblings 021ca678 / 021c11c8 wall (ship-as-.s)" — the
 * 3x repetition of the single-record template hits a scheduling wall the
 * one-shot form (021c74e0) doesn't. Attempted here for confirmation. */
extern int  func_02006c0c(void *p, int b, int c);
extern void func_0201d47c(void *cmd);
extern void func_0201e5b8(void *cmd);
extern void Task_Invoke(int h);
extern char data_ov006_021cdd30[];
extern char data_ov006_021cdd48[];
extern char data_ov006_021cdd60[];

int func_ov006_021c11c8(void) {
    char cmd[40];
    int h;

    h = func_02006c0c(data_ov006_021cdd30, 4, 0);
    func_0201d47c(cmd);
    *(int *)(cmd + 0) = h;
    *(unsigned short *)(cmd + 20) = (*(unsigned short *)(cmd + 20) & ~15) | 8;
    *(int *)(cmd + 8) = -1;
    *(int *)(cmd + 12) = 0x6440;
    *(short *)(cmd + 16) = 0x40;
    func_0201e5b8(cmd);
    Task_Invoke(h);

    h = func_02006c0c(data_ov006_021cdd48, 4, 0);
    func_0201d47c(cmd);
    *(int *)(cmd + 0) = h;
    *(unsigned short *)(cmd + 20) = (*(unsigned short *)(cmd + 20) & ~15) | 8;
    *(int *)(cmd + 8) = -1;
    *(int *)(cmd + 12) = 0x6520;
    *(short *)(cmd + 16) = 0x60;
    func_0201e5b8(cmd);
    Task_Invoke(h);

    h = func_02006c0c(data_ov006_021cdd60, 4, 0);
    func_0201d47c(cmd);
    *(int *)(cmd + 0) = h;
    *(unsigned short *)(cmd + 20) = (*(unsigned short *)(cmd + 20) & ~15) | 8;
    *(int *)(cmd + 8) = -1;
    *(int *)(cmd + 12) = 0x6720;
    *(short *)(cmd + 16) = 0x80;
    func_0201e5b8(cmd);
    Task_Invoke(h);

    return 1;
}
