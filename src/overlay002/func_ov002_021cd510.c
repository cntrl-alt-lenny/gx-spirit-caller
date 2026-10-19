extern unsigned char data_ov002_022ce950[];
extern unsigned short data_ov002_022d0252[][2];
extern unsigned char data_ov002_022cf1a6[];
extern void func_ov002_021b20cc(int idx, int id, int flag);
extern void func_ov002_021b212c(int idx, int val, int flag);
extern void func_ov002_021b218c(int idx, int arg1, int arg2, int arg3);
extern int func_ov002_0229ade0(int a, int b, int c, int d);
void func_ov002_021cd510(void) {
    int f = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    int t = *(unsigned short *)(data_ov002_022ce950 + 2);
    int v = *(unsigned short *)(data_ov002_022ce950 + 4);
    int u = *(unsigned short *)(data_ov002_022ce950 + 6);
    int a = (unsigned char)t;
    int b = (unsigned char)(t >> 8);
    int id = v & 0x7fff;
    int c = (unsigned char)u;
    int d = (unsigned char)(u >> 8);
    if (v & 0x8000) {
        func_ov002_021b212c(data_ov002_022d0252[a * 2 + f][0], (unsigned short)id, c);
    } else if (d) {
        func_ov002_021b218c(*(unsigned short *)(data_ov002_022cf1a6 + (f & 1) * 0x868 + a * 0x14), (unsigned short)id, b, c);
    } else if (b >= 6) {
        func_ov002_021b20cc(*(unsigned short *)(data_ov002_022cf1a6 + (f & 1) * 0x868 + a * 0x14), (unsigned short)id, c);
    } else {
        func_ov002_021b212c(*(unsigned short *)(data_ov002_022cf1a6 + (f & 1) * 0x868 + a * 0x14), (unsigned short)id, c);
    }
    func_ov002_0229ade0(0x24, 0, 0, 0);
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
