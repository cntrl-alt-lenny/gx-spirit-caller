/* func_ov004_021cfbec: command-record family (see ov006_core.h). Alloc a
 * handle via func_0202be4c(flag), fill a 40-byte command record via
 * func_0201d47c, patch three fields (a "base id" word at +0xc, a
 * mode/type halfword at +0x14 built from the pre-filled value, and a
 * flag halfword at +0x10 that's -1 or 0x400 depending on `flag`), submit
 * via func_0201e5b8, then Task_Invoke the handle.
 */
extern int func_0202be4c(int c);
extern void func_0201d47c(void *cmd);
extern void func_0201e5b8(void *cmd);
extern void Task_Invoke(void *);

void func_ov004_021cfbec(int id, int flag) {
    char cmd[0x28];
    int h = func_0202be4c(flag);
    unsigned short mode;

    func_0201d47c(cmd);

    {
        int idval = (id << 10) + 0x10000;
        mode = *(unsigned short *)(cmd + 0x14);
        *(int *)(cmd + 0xc) = idval;
        mode = (mode & ~0xf) | 9;
        *(unsigned short *)(cmd + 0x14) = mode;
    }

    mode = *(unsigned short *)(cmd + 0x14);
    mode |= 0x10;
    *(unsigned short *)(cmd + 0x14) = mode;

    *(int *)cmd = h;
    *(short *)(cmd + 0x10) = (short)(flag != 0 ? -1 : 0x400);

    func_0201e5b8(cmd);
    Task_Invoke((void *)h);
}
