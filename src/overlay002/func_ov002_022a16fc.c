typedef struct {
    char _pad00[4];
    int f4;
    char _pad08[0x2c];
    int f34;
} ObjA16;
typedef struct {
    char _pad00[0xd4];
    int fd4;
} StateA;
typedef struct {
    char _pad00[0x52];
    unsigned short f52;
} InputState;
extern StateA data_ov002_022d0f2c;
extern InputState data_02104bac;
extern int func_ov002_022a1870(int *p);
extern int func_ov002_022a1890(ObjA16 *s, int mode);
extern unsigned int func_0200617c(void);
extern unsigned int func_02006194(void);

static inline int state_active(void) { return (data_ov002_022d0f2c.fd4 > 0); }

int func_ov002_022a16fc(ObjA16 *s)
{
    if (!func_ov002_022a1870((int *)s)) return 0;
    switch (state_active()) { case 0:
        if (func_02006194() || func_0200617c()) {
            if (!func_ov002_022a1890(s, 0)) return 0;
        }
        if (data_02104bac.f52 & 0x300) return 0;
    }
    return 1;
}










