/* func_ov006_021b66c4: overlay006 init/setup routine.
 * data_02104f4c layout is established ground truth, reused verbatim from
 * many already-matched sibling files (func_ov008_021aa94c.c,
 * overlay021/*.c, overlay020/func_ov020_021aa67c.c):
 *   struct { int w0; unsigned chan : 3; } data_02104f4c;
 */

extern void Fill32(int val, void *dst, int n);
extern char data_ov006_0224f448[];
extern char data_ov006_021cbeb8[];
extern char data_ov006_021cbecc[];
extern struct { int w0; unsigned chan : 3; } data_02104f4c;

extern void func_ov006_021b8d30(void *self);
extern void func_ov006_021b8bf4(void *self);
extern int  func_0202c0c0(int id);
extern void func_020a978c(void *dst, int v);
extern void func_02011b9c(void *dst, void *src);
extern void func_ov006_021b7f6c(void *self);
extern void func_ov006_021b7e80(void *self);
extern void func_ov006_021b7c94(void *self, int i, int a);
extern void func_ov006_021b7cc0(void *self, int i, int a, int b);
extern void func_ov006_021b7bb0(void *self, int i);

typedef struct {
    char pad1[0x816a];
    unsigned short src[5];   /* +0x816a */
    unsigned short dst[5];   /* +0x8174 */
} SelfArr;

int func_ov006_021b66c4(unsigned char *self) {
    int i;
    int j;
    int t;

    Fill32(0, data_ov006_0224f448, 0xca98);

    *(int *)(self + 0x6298) = 1;
    func_ov006_021b8d30(self);

    func_ov006_021b8bf4(self);

    Fill32(0, self, 0x124);

    self[0] = (unsigned char)data_02104f4c.chan;
    t = func_0202c0c0(0x486);
    func_020a978c(self + 1, t);

    func_02011b9c(self + 0x1c, data_ov006_021cbeb8);
    func_ov006_021b7f6c(self);
    func_ov006_021b7e80(self);

    func_02011b9c(self + 0x1c, data_ov006_021cbecc);
    func_ov006_021b7f6c(self);

    for (i = 0; i < 5; i++) {
        func_ov006_021b7c94(self, i, 1);
        func_ov006_021b7cc0(self, i, 0, -1);
        func_ov006_021b7cc0(self, i, 1, -1);
        func_ov006_021b7cc0(self, i, 2, -1);
        func_ov006_021b7cc0(self, i, 3, -1);
        func_ov006_021b7cc0(self, i, 4, -1);
        func_ov006_021b7cc0(self, i, 5, -1);
        func_ov006_021b7cc0(self, i, 6, -1);
        func_ov006_021b7bb0(self, i);
    }

    for (j = 0; j < 5; j++) {
        ((SelfArr *)self)->dst[j] = ((SelfArr *)self)->src[j];
    }

    return 1;
}
