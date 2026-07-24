struct S022b53c4 {
    int f0;
};

extern int  func_0202d9a0(void);
extern int  func_02021660(int a, int b, int c);
extern int  func_0202c9a0(void);
extern void func_020216b0(int a, int b, int c);

void func_ov002_022b53c4(struct S022b53c4 *p) {
    int h;
    if (func_0202d9a0() == 0)
        return;
    h = func_02021660(p->f0, 3, 0);
    func_020216b0(h, 0, func_0202c9a0() != 0);
}
