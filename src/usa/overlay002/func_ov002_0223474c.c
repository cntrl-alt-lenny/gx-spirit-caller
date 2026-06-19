/* func_ov002_0223474c: global 3-way switch (brief 262). */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022ce1a8[];
extern int func_ov002_0220e428(void);
extern void func_ov002_0226ac6c(int bit0, int one, int z1, int z2);
int func_ov002_0223474c(struct S *self) {
    switch (*(int *)(data_ov002_022ce1a8 + 0x5a8)) {
    case 0x80:
        if (func_ov002_0220e428() != 0) return 0x7f;
        break;
    case 0x7f:
        func_ov002_0226ac6c(self->bit0, 1, 0, 0);
        break;
    }
    return 0;
}
