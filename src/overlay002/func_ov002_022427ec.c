typedef struct { unsigned short f0; unsigned short f2; } Self;
typedef struct { char pad[0x5b8]; int state; } State;
typedef struct { char pad[0xd70]; int d70, d74, d78; } Scratch;
extern State data_ov002_022ce288;
extern Scratch data_ov002_022d016c;
extern int func_ov002_022577dc(void *self);
extern void func_ov002_0229cf10(char *dst, const char *fmt, int val);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_022593a8(int a, int b, int c);
extern int func_ov002_0223fd74(void *arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern void func_ov002_0223dcc0(Self *self, int a, int b);
int func_ov002_022427ec(Self *self) {
    char buf[0x100];
    switch (data_ov002_022ce288.state) {
    case 0:
        if (func_ov002_022577dc(self) < 2) return 1;
        func_ov002_0229cf10(buf, (const char *)0xa1, 2);
        func_ov002_021ae400((unsigned)(self->f2 << 31) >> 31, (int)buf);
    case 2:
        func_ov002_022593a8((unsigned)(self->f2 << 31) >> 31, self->f0, (int)func_ov002_0223fd74);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
    case 3:
        if (func_ov002_022593f4() != 0) {
            func_ov002_0223dcc0(self, data_ov002_022d016c.d70, data_ov002_022d016c.d74 + data_ov002_022d016c.d78);
            data_ov002_022ce288.state++;
            return 0;
        } else {
            data_ov002_022ce288.state--;
            return 0;
        }
    default: return 1;
    }
}
