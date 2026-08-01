/* func_ov002_02216334: two backward loops over self->f_6's high byte (a
 * count), scanning card slots via func_ov002_0223de04/func_ov002_021b939c
 * for kind==0xe entries. Loop 1 validates (func_ov002_021ca5b8, early
 * return 0 on failure). Loop 2 dispatches func_ov002_021d8038 per match,
 * using the same struct Ov002Key layout as its own matched file.
 */
typedef unsigned short u16;
typedef unsigned char u8;
typedef unsigned int u32;

struct Node {
    char pad0[2];
    u16 bit0 : 1;
    u16 rest : 15;
    char pad4[2];
    u16 f_6;
};

struct Ov002Key { u32 id : 13; u32 b : 1; u32 : 8; u32 a : 8; u32 : 2; };

extern int func_ov002_021b939c(void);
extern int func_ov002_021c9310(int b0, int b1, int hi);
extern int func_ov002_021ca5b8(int arg0, int arg1);
extern void func_ov002_021d8038(int arg0, void *arg1, int arg2);
extern void func_ov002_021e2a4c(void);
extern void func_ov002_021e2b6c(void);
extern int func_ov002_0223de04(struct Node *self, int idx);

int func_ov002_02216334(struct Node *self) {
    int n, i;

    n = ((u32)self->f_6 << 16) >> 24;
    if (n != 0) {
        for (i = n - 1; i >= 0; i--) {
            int v, b1, b0;
            func_ov002_0223de04(self, i);
            v = func_ov002_021b939c();
            b1 = ((int)(u16)v >> 8) & 0xff;
            if (b1 == 0xe) {
                b0 = v & 0xff;
                if (func_ov002_021ca5b8(self->bit0, b0) == 0) return 0;
            }
        }

        func_ov002_021e2a4c();
        n = ((u32)self->f_6 << 16) >> 24;
        for (i = n - 1; i >= 0; i--) {
            int v, b1, b0;
            func_ov002_0223de04(self, i);
            v = func_ov002_021b939c();
            b1 = ((int)(u16)v >> 8) & 0xff;
            if (b1 == 0xe) {
                u16 hi = (u16)((u32)v >> 16);
                struct Ov002Key *key;
                int bit13;
                b0 = v & 0xff;
                key = (struct Ov002Key *)func_ov002_021c9310(b0, b1, hi);
                bit13 = key->b;
                func_ov002_021d8038(bit13, key, self->bit0 != bit13);
            }
        }
        func_ov002_021e2b6c();
    }
    return 0;
}
