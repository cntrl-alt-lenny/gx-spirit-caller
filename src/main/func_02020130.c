typedef struct {
    char pad[0x30];
    int state;
} State;
extern State data_02191f40;
extern unsigned char data_021922e0[];
extern void func_0201f138(int index);
extern void func_0201f19c(int arg);
extern int func_02020188(void);
/* The thunk is typed void in its C file, but this caller reads its result. */
extern int func_020a05f8(void *p);

int func_02020130(void)
{
    int result;
    if (data_02191f40.state != 6)
        return 0;
    func_0201f138(3);
    result = func_020a05f8(data_021922e0);
    if (result != 0) {
        func_0201f19c(result);
        result = 0;
    } else {
        if (func_02020188() == 0)
            result = 0;
        else
            result = 1;
    }
    return result;
}
