struct State {
    char pad0[0x24];
    int state;
    char pad1[6];
    unsigned short text[26];
    char pad2[6];
    void *field68;
    int field6c;
    int field70;
    int field74;
};
extern struct State *data_0219daec;
extern int func_02045280(void);
extern int func_02045678(void);
extern int func_020459c4(unsigned short *arr);
extern void func_020466f4(int arg);
extern void func_020480b4(int a, int b);
extern void func_0205396c(void *a);
extern void func_0209448c();
extern void func_020944a4();

int func_0204706c(unsigned short *text, int unused, int a, int b)
{
    unsigned int len;
    if (text == 0) return 0;
    if (func_02045280() != 0 || data_0219daec->state != 0) return 0;
    data_0219daec->field70 = a;
    data_0219daec->field74 = b;
    if (text == 0 || *text == 0) {
        len = 0;
    } else {
        func_0209448c(0, data_0219daec->text, 0x34);
        if ((unsigned int)func_020459c4(text) > 25) len = 25;
        else len = func_020459c4(text);
        func_020944a4(text, data_0219daec->text, len * 2);
    }
    data_0219daec->text[len] = 0;
    if (func_02045678() != 4) {
        func_020480b4(2, -60010);
        return 1;
    }
    func_020466f4(1);
    func_0205396c(data_0219daec->field68);
    return 1;
}
