/* The original supplies two arguments despite the C wrapper's void prototype. */
extern void *func_02060c9c(void *arg, void *key);
/* The original supplies only r0, fewer arguments than the four-argument thunk. */
extern int func_020ace00();
extern int func_02060b84(int a, int b, int c);
extern void *func_020540d0(char *s, int index);
extern void func_02060604(int index, int a, int b, int c, int d);
extern char data_021013e4[];
extern char data_021013b8[];
extern char data_021013ec[];
extern char *data_0219e518;

void func_02060ad4(void *arg) {
    int value;
    int key;
    int index;
    int text;
    int *entry;
    value = func_020ace00(func_02060c9c(arg, data_021013e4));
    key = func_020ace00(func_02060c9c(arg, data_021013b8));
    text = (int)func_02060c9c(arg, data_021013ec);
    index = func_02060b84(0, key, 0);
    if (index == -1) return;
    entry = func_020540d0(data_0219e518, index);
    entry[2] = value;
    func_02060604(index, value > 0, 0, text, 0);
}
