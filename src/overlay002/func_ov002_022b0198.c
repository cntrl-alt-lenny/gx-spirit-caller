extern void func_02006110(int *out_a, int *out_b);
extern void func_0200612c(int *out_a, int *out_b);
extern unsigned int func_0200617c(void);
extern unsigned int func_02006194(void);
extern void *func_02006c0c(void *ptr, int a, int b);
extern void Task_Invoke(void *p);
extern void *func_0201d738(void *self);
extern void func_0208fd30(void *src, int offset, unsigned int size);
extern int func_ov002_0225984c(void);
extern int func_ov002_022aecd0(void *p, int a);
extern int func_ov002_022b00fc(int unused0, int arg1, int arg2, int arg3);
extern char data_ov002_022cc804[];
extern int data_ov002_022d0f2c[];
extern char data_ov002_022d1a9c[];

static inline int is_busy(void) { return data_ov002_022d0f2c[53] > 0; }

void func_ov002_022b0198(int *p) {
    int old = p[2];
    int flags;
    int hit;
    int x, y;
    p[2] = -1;
    if ((unsigned int)is_busy() != 0 || data_ov002_022d0f2c[52] != 0) return;
    flags = func_ov002_0225984c();
    if (flags == 0) return;
    if (func_02006194() == 0 && func_0200617c() == 0) return;
    func_0200612c(&x, &y);
    hit = func_ov002_022b00fc((int)p, x, y, flags);
    if (hit < 0) return;
    func_02006110(&x, &y);
    if (hit != func_ov002_022b00fc((int)p, x, y, flags)) return;
    p[2] = hit;
    if (old != hit) {
        void *task = func_02006c0c(data_ov002_022cc804, 4, 0);
        char *base = func_0201d738(task);
        func_0208fd30(base + ((p[2] - 2) << 10), 0x3000, 0x400);
        Task_Invoke(task);
    }
    if (func_0200617c() == 0) return;
    func_ov002_022aecd0(data_ov002_022d1a9c, hit);
}






