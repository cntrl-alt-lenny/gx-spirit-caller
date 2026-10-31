struct State {
    char pad0[0x30];
    int state;
    char pad1[4];
    void (*callback)(void *, ...);
    char pad2[4];
    int mode;
};
extern struct State data_02191f40;
extern char data_020c6840[];
extern char data_020c685c[];
extern void func_0201f138(int index);
extern int func_0201f6c0(void);
extern int func_0201f724(void);
extern int func_02020130(void);
extern int func_02020188(void);
extern int func_02020b84(void);
void func_02020ba0(void)
{
    if (data_02191f40.state == 1) {
        if (data_02191f40.callback != 0)
            data_02191f40.callback(data_020c6840);
    } else {
        if (data_02191f40.callback != 0)
            data_02191f40.callback(data_020c685c, data_02191f40.state);
        if (data_02191f40.state != 6 && data_02191f40.state != 5 && data_02191f40.state != 4) {
            func_0201f138(3);
            func_02020b84();
        } else {
            func_0201f138(3);
            switch (data_02191f40.mode) {
            case 3:
                if (func_02020130() != 0) return;
                func_02020b84();
                break;
            case 1:
            case 5:
                if (func_02020188() != 0) return;
                func_02020b84();
                break;
            case 2:
                if (func_0201f6c0() != 0) return;
                func_02020b84();
                break;
            case 0:
            case 4:
                if (func_0201f724() != 0) return;
                func_02020b84();
                break;
            }
        }
    }
}
