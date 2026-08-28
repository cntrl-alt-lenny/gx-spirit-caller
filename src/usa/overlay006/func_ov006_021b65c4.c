/* func_ov006_021b65c4: overlay006 init/setup routine.
 * data_02104e6c layout is established ground truth, reused verbatim from
 * many already-matched sibling files (func_ov008_021aa94c.c,
 * overlay021/*.c, overlay020/func_ov020_021aa67c.c):
 *   struct { int w0; unsigned chan : 3; } data_02104e6c;
 */

extern void Fill32(int val, void *dst, int n);
extern char data_ov006_0224f328[];
extern char data_ov006_021cbd98[];
extern char data_ov006_021cbdac[];
extern struct { int w0; unsigned chan : 3; } data_02104e6c;

extern void func_ov006_021b8c30(void *self);
extern void func_ov006_021b8af4(void *self);
extern int  func_0202c06c(int id);
extern void func_020a9698(void *dst, int v);
extern void func_02011b68(void *dst, void *src);
extern void func_ov006_021b7e6c(void *self);
extern void func_ov006_021b7d80(void *self);
extern void func_ov006_021b7b94(void *self, int i, int a);
extern void func_ov006_021b7bc0(void *self, int i, int a, int b);
extern void func_ov006_021b7ab0(void *self, int i);

typedef struct {
    char pad1[0x816a];
    unsigned short src[5];   /* +0x816a */
    unsigned short dst[5];   /* +0x8174 */
} SelfArr;

int func_ov006_021b65c4(unsigned char *self) {
    int i;
    int j;
    int t;

    Fill32(0, data_ov006_0224f328, 0xca98);

    *(int *)(self + 0x6298) = 1;
    func_ov006_021b8c30(self);

    func_ov006_021b8af4(self);

    Fill32(0, self, 0x124);

    self[0] = (unsigned char)data_02104e6c.chan;
    t = func_0202c06c(0x486);
    func_020a9698(self + 1, t);

    func_02011b68(self + 0x1c, data_ov006_021cbd98);
    func_ov006_021b7e6c(self);
    func_ov006_021b7d80(self);

    func_02011b68(self + 0x1c, data_ov006_021cbdac);
    func_ov006_021b7e6c(self);

    for (i = 0; i < 5; i++) {
        func_ov006_021b7b94(self, i, 1);
        func_ov006_021b7bc0(self, i, 0, -1);
        func_ov006_021b7bc0(self, i, 1, -1);
        func_ov006_021b7bc0(self, i, 2, -1);
        func_ov006_021b7bc0(self, i, 3, -1);
        func_ov006_021b7bc0(self, i, 4, -1);
        func_ov006_021b7bc0(self, i, 5, -1);
        func_ov006_021b7bc0(self, i, 6, -1);
        func_ov006_021b7ab0(self, i);
    }

    for (j = 0; j < 5; j++) {
        ((SelfArr *)self)->dst[j] = ((SelfArr *)self)->src[j];
    }

    return 1;
}
