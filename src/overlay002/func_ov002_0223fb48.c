/* func_ov002_0223fb48: gate on self->f_2 bits[13:12]==2 -> return 1; else
 * check a per-bit0 flag table (data_ov002_022cd744): if set, forward
 * (self,arg1,0x10d3) to func_ov002_0228df3c; else if
 * data_ov002_022ce288.f_5b8 != 0, tail-call func_ov002_0223f5b4(self);
 * else run a first-time setup sequence and bump data_ov002_022ce288.f_5b8.
 */
typedef struct {
    unsigned short f_0;
    unsigned short bit0 : 1;
    unsigned short _pad1 : 11;
    unsigned short hibits : 2;
    unsigned short _pad2 : 2;
} Self;

struct CE288 {
    char pad[0x5b8];
    int f_5b8;
};

#define BIT0(x) (((unsigned)((x) << 31)) >> 31)

extern int data_ov002_022cd744[];
extern struct CE288 data_ov002_022ce288;

extern int func_ov002_0228df3c(Self *self, int arg1, unsigned short f0);
extern int func_ov002_022577dc(void);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0225935c(int a, int b, int c);
extern int func_ov002_0223f5b4(Self *self, int arg1);
extern void func_ov002_022575c8(void);

int func_ov002_0223fb48(Self *self, int arg1) {
    if (self->hibits == 2) {
        return 1;
    }
    if (data_ov002_022cd744[self->bit0] == 1) {
        return func_ov002_0228df3c(self, arg1, 0x10d3);
    }
    if (data_ov002_022ce288.f_5b8 != 0) {
        goto ret_0223f5b4;
    }
    if (func_ov002_022577dc() == 0) {
        return 1;
    }
    func_ov002_021ae400(self->bit0, 0x65);
    func_ov002_0225935c(self->bit0, 0x10d3, (int)func_ov002_022575c8);
    data_ov002_022ce288.f_5b8++;
    return 0;

ret_0223f5b4:
    return func_ov002_0223f5b4(self, arg1);
}
