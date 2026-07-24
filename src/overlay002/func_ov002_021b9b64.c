typedef unsigned short u16;

extern int func_ov002_021b947c(void);
extern int func_ov002_021c93f0(int b0, int b1, int hi);

int func_ov002_021b9b64(void) {
    int v = func_ov002_021b947c();
    if (v == 0x1000)
        return 0;
    {
        u16 lo = (u16)v;
        int b1 = ((int)lo >> 8) & 0xff;
        /* unsigned shift required here (mwcc emits lsr, not asr) */
        u16 hi = (u16)((unsigned int)v >> 16);
        int b0 = v & 0xff;
        return func_ov002_021c93f0(b0, b1, (int)hi);
    }
}
