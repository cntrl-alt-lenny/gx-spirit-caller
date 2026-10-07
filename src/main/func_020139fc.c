extern int func_02019124(void);
extern void func_0201913c(int v);

void func_020139fc(int x) {
    int base = func_02019124();
    int v = (x * 255) / 255 + base;

    if (v > 255) {
        v = 255;
    }
    func_0201913c(v);
}
