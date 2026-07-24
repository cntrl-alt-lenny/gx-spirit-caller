struct S022b53c4 {
    int f0;
};

extern int  func_0202d94c(void);
extern int  func_0202160c(int a, int b, int c);
extern int  func_0202c94c(void);
extern void func_0202165c(int a, int b, int c);

void func_ov002_022b52b4(struct S022b53c4 *p) {
    int h;
    if (func_0202d94c() == 0)
        return;
    h = func_0202160c(p->f0, 3, 0);
    func_0202165c(h, 0, func_0202c94c() != 0);
}
