typedef struct {
    char pad[0x44];
    int f44, f48, f4c, f50, f54, f58, f5c, f60;
} State;
extern int func_0202224c(int idx);
extern int func_02022234(unsigned int idx, unsigned int v);
extern unsigned int func_0200617c(void);
extern int func_ov021_021aae68(void *o, int col, int idx);
extern int data_ov021_021ac874[];
extern unsigned char data_02104bac[];
int func_ov021_021aab7c(State *s) {
    int flags = func_0202224c(0);
    s->f5c++;
    if (flags & 1) s->f60++;
    if (s->f5c >= 105 && s->f60 < 224) {
        if (++s->f54 >= 2) {
            s->f54 = 0;
            if (--s->f50 < 0) s->f50 = 255;
            if (++s->f58 >= 16) {
                s->f58 = 0;
                if (s->f48 < s->f44) {
                    func_ov021_021aae68(s, s->f4c, s->f48);
                } else {
                    func_ov021_021aae68(s, s->f4c, -1);
                    flags |= 1;
                }
                if (++s->f4c >= 16) s->f4c = 0;
                s->f48++;
            }
        }
    }
    *(volatile unsigned int *)0x0400101c = ((-s->f50 << 16) & 0x01ff0000) | 0x1f8;
    if (s->f5c >= 390) {
        int t = s->f5c - 390;
        int idx = t / 555;
        int rem = t % 555;
        flags &= ~6;
        if (idx >= 0 && idx < 11) {
            if (rem == 0) {
                func_02022234(2, data_ov021_021ac874[idx]);
                flags |= 2;
            } else if (rem == 465) flags |= 4;
        }
    }
    {
        unsigned short keys = *(unsigned short *)(data_02104bac + 0x54);
        if (s->f60 >= 795) {
            if ((keys & 9) || func_0200617c()) flags |= 8;
        }
    }
    func_02022234(0, flags);
    return 1;
}
