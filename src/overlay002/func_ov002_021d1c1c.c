typedef unsigned short u16;
typedef struct { u16 flags, f2, f4, f6; char pad[0x804]; int f80c, f810; } State;
extern State data_ov002_022ce950;
extern char data_ov002_022ca9b4[];
extern int data_ov002_022cd73c[];
extern int func_0202b100(int a0);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021ae484(int x);
extern int func_ov002_021ae4a0(int x, int y);
/* Original caller supplies no arguments to this status thunk. */
extern int func_ov002_021ae7a8();
extern void func_ov002_0229cd88(void *self, unsigned int arg1);
extern void func_ov002_0229cdb8(void *self, unsigned int arg1);
extern void func_ov002_0229ce5c(char *dst, const char *fmt, const char *str);
void func_ov002_021d1c1c(void) {
    char b[256], a[256];
    int id = data_ov002_022ce950.f4;
    int arg = data_ov002_022ce950.f6;
    if (data_ov002_022ce950.f810 == 0) {
        data_ov002_022ce950.f810++;
        if (id >= 0xa9 && id <= 0xcb) {
            func_ov002_0229cd88(b, id);
            func_ov002_0229cdb8(b, (unsigned int)data_ov002_022ca9b4);
            func_ov002_0229cdb8(b, 0xcc);
            func_ov002_021ae4a0((int)b, 3);
        } else if (id == 0x8c) {
            func_ov002_0229ce5c(a, (const char *)id, (const char *)func_0202b100(arg));
            func_ov002_021ae484((int)a);
        } else {
            func_ov002_021ae400(data_ov002_022cd73c[1], id);
        }
    }
    if (func_ov002_021ae7a8() == 0) data_ov002_022ce950.f80c = 0;
}

