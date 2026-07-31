/* func_0204f310: init call, then populate several fields on the
 * func_020498f0() singleton (called fresh, uncached, for each field
 * write), then register 5 (id, data) pairs via func_02067850.
 */
extern char *func_020498f0(void);
extern void func_0204f3c0(int x);
extern void func_02067850(int id, void *data);
extern char data_020ff974[];
extern char data_020ff980[];
extern char data_020ff9a0[];
extern char data_020ff9ac[];
extern char data_020ff9b8[];

void func_0204f310(int param0, int param1, int param2, int param3)
{
    func_0204f3c0(0);
    func_020498f0()[0x15] = param0;
    func_020498f0()[0x16] = param1;
    *(int *)(func_020498f0() + 0x464) = param2;
    *(int *)(func_020498f0() + 0x468) = param3;
    func_020498f0()[0x17d] = 0;
    func_020498f0()[0x2d0] = 0;
    func_02067850(0x32, data_020ff980);
    func_02067850(0x33, data_020ff9a0);
    func_02067850(0x34, data_020ff9ac);
    func_02067850(0x35, data_020ff9b8);
    func_02067850(0x36, data_020ff974);
}
