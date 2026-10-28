extern int func_02073da0(const unsigned short *, const unsigned short *);
extern void func_0207352c(void *, unsigned int, int);
extern void func_02072bcc(char *);
extern unsigned int data_0219ef1c;
extern unsigned short data_0219ef2c[];
extern unsigned char data_0219eec4;
void func_02072a14(char *p, unsigned int size) {
    unsigned short op, a, b, c, d;
    unsigned int src, dst;
    int same, target;
    if (size < 0x1c) return;
    if (func_02073da0((unsigned short *)(p + 8), data_0219ef2c) == 0) return;
    if (data_0219ef1c == 0) return;
    if (*(unsigned short *)p != 0x100) return;
    if (*(unsigned short *)(p + 2) != 8) return;
    if (*(unsigned short *)(p + 4) != 0x406) return;
    op = *(unsigned short *)(p + 6);
    op = (op >> 8) | (op << 8);
    if (op != 1 && op != 2) return;
    a = *(unsigned short *)(p + 0xe);
    b = *(unsigned short *)(p + 0x10);
    a = (a >> 8) | (a << 8);
    b = (b >> 8) | (b << 8);
    src = ((unsigned int)a << 16) | b;
    c = *(unsigned short *)(p + 0x18);
    d = *(unsigned short *)(p + 0x1a);
    c = (c >> 8) | (c << 8);
    d = (d >> 8) | (d << 8);
    dst = ((unsigned int)c << 16) | d;
    same = src == data_0219ef1c;
    target = data_0219ef1c == dst;
    if (!same) func_0207352c(p + 8, src, target);
    if (op == 1 && target) { func_02072bcc(p); return; }
    if (op == 2 && target && same) data_0219eec4 = 1;
}
