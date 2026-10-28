typedef struct { int f0; int f4; char pad[0x2c]; int f34; } ObjA16;
typedef struct { char pad[0xd4]; int fd4; } StateA;
typedef struct { char pad[0x52]; unsigned short f52; } InputState;
typedef struct { unsigned short active; } Menu;
extern StateA data_ov002_022d0f2c;
extern InputState data_02104bac;
extern Menu data_ov002_022d1a9c;
extern int func_ov002_022a1870(int *p);
extern int func_ov002_022a1890(ObjA16 *s, int mode);
extern unsigned int func_0200617c(void);
extern unsigned int func_02006194(void);
extern void func_0200612c(int *out_a, int *out_b);
extern int func_ov002_022ae588(Menu *menu, int x, int y);
static inline int state_active(void) { return data_ov002_022d0f2c.fd4 > 0; }
int func_ov002_022a1784(ObjA16 *s)
{
    int x, y;
    if (!s->f0) return 0;
    switch (state_active()) { case 0:
        if (func_02006194() || func_0200617c()) {
            if (!func_ov002_022a1890(s, 0)) {
                func_0200612c(&x, &y);
                if (func_ov002_022ae588(&data_ov002_022d1a9c, x, y) < 0) {
                    if (func_ov002_022a1870((int *)s) || func_ov002_022a1890(s, 1)) return 0;
                }
            }
        }
        if (data_02104bac.f52 & 0x300) return 0;
    }
    return 1;
}
