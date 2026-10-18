typedef struct {
    char pad[0x268];
    unsigned int a : 5;
    unsigned int value268 : 4;
    unsigned int b : 23;
    char pad26c[0x14];
    unsigned int flags;
    unsigned int state : 8;
    unsigned int value284 : 4;
    unsigned int c : 20;
} State;
extern State data_ov011_021d403c;
extern void func_ov011_021cb218(void);
extern void func_ov011_021ceffc(void);

void func_ov011_021d1c80(int v) {
    data_ov011_021d403c.value284 = v;
    data_ov011_021d403c.value268 = data_ov011_021d403c.value284;
    data_ov011_021d403c.flags |= 0x200;
    func_ov011_021cb218();
    func_ov011_021ceffc();
    data_ov011_021d403c.state = 2;
}
