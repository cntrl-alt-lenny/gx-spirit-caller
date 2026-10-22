typedef unsigned char u8;
typedef struct { unsigned long long first, second; unsigned short id; } Input;
extern char data_020fe73c[], data_020fe744[], data_020fe74c[], data_020fe754[], data_020fe760[], data_020fe77c[];
/* The assembly implementation returns the saved IRQ mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern int OS_SNPrintf(char *, int, const char *, ...);
extern int OS_SPrintf(char *, const char *, ...);
extern void func_020945f4(void *, int, unsigned int);
extern void func_02094688(void *, void *, int);
extern void func_02093a20(u8 *);
extern void func_020939a4(unsigned char *);
extern void func_02093bfc(void);
extern int func_0209bc20(void *);
extern int func_0209bb60(void *);
extern void *func_0207cc50(void);
extern void *func_0207cbe0(unsigned short *);
extern void func_020928cc(void *, int);
extern int func_0203cb90(void);
extern void func_0203f6cc(void *, void *);
int func_020409d8(char *out, Input *in) {
    u8 config[0x54];
    int date[4];
    int time[3];
    u8 mac[6];
    unsigned short length;
    int irq;
    u8 *p;
    void *q;
    int i;
    u8 *src;
    char *dst;
    func_020945f4(out, 0, 0x94);
    if (in->first != 0) OS_SNPrintf(out, 14, data_020fe73c, in->first);
    else OS_SNPrintf(out, 14, data_020fe73c, in->second);
    OS_SNPrintf(out + 14, 7, data_020fe744, in->id);
    if (*(u8 *)0x027ffe0c == 0) func_02093bfc();
    func_02094688((void *)0x027ffe0c, out + 0x15, 4);
    if (*(u8 *)0x027ffe10 == 0) func_02093bfc();
    func_02094688((void *)0x027ffe10, out + 0x1a, 2);
    out[0x1d] = '0';
    func_02093a20(mac);
    src = mac; dst = out + 0x1f;
    for (i = 0; i < 6; i++) { OS_SPrintf(dst, data_020fe74c, *src); src++; dst += 2; }
    func_020939a4(config);
    if (config[0] > 6) config[0] = 1;
    OS_SNPrintf(out + 0x2c, 3, data_020fe74c, config[0]);
    func_02094688(config + 4, out + 0x7e, 0x14);
    OS_SNPrintf(out + 0x2f, 5, data_020fe754, config[2], config[3]);
    if (func_0209bc20(date) != 0 || func_0209bb60(time) != 0) return 0;
    OS_SNPrintf(out + 0x34, 13, data_020fe760, date[0], date[1], date[2], time[0], time[1], time[2]);
    irq = OS_DisableIrq();
    p = func_0207cc50();
    func_020928cc(p, 6);
    if (p == 0) { OS_RestoreIrq(irq); return 0; }
    dst = out + 0x41;
    for (i = 0; i < 6; i++) { OS_SPrintf(dst, data_020fe74c, p[i]); dst += 2; }
    OS_SNPrintf(out + 0x6f, 14, data_020fe77c, func_0203cb90());
    q = func_0207cbe0(&length);
    func_020928cc(q, 0x20);
    if (q == 0) { OS_RestoreIrq(irq); return 0; }
    func_0203f6cc(q, out + 0x72);
    func_02094688(q, out + 0x4e, 0x20);
    OS_RestoreIrq(irq);
    return 1;
}

