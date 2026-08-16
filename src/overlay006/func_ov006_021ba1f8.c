/* func_ov006_021ba1f8: object init — set up handle, clear the "slot -1"
 * mailbox + 40 general mailbox slots (field_174, stride 0x20), then run a
 * fixed setup-call sequence gated by the object's mode word (self+0x40),
 * dispatch a per-mode "enter" call via a 7-way jump table, then a fixed
 * teardown-call sequence and a global flag set.
 */
extern int func_020211c8(void *);
extern void func_0202147c(void);
extern void func_0202227c(int, void *);
extern void func_ov006_021bbdc0(void *self);
extern void func_ov006_021bbe7c(void *self);
extern void func_ov006_021bc0cc(void *self);
extern void func_ov006_021be6f4(void *self);
extern void func_ov006_021bc45c(void *self, int, int, int, int);
extern void func_ov006_021bcb94(void *self, int, int);
extern void func_ov006_021bcedc(void *self, int, int);
extern void func_ov006_021beec4(void *self);
extern void func_ov006_021bf01c(void *self);
extern void func_ov006_021bf2a4(void *self);
extern void func_ov006_021bf454(void *self);
extern void func_ov006_021bf4fc(void *self);
extern void func_ov006_021bf5e4(void *self);
extern void func_ov006_021bef6c(void *self);
extern void func_ov006_021bf844(void *self);
extern void func_ov006_021c0c14(void *self);
extern void func_ov006_021c0dc8(void *self);
extern void func_ov006_021bee68(void *self, int);
extern void func_ov006_021c11c8(void *self);
extern char data_020f8c60[];
extern char data_021040ac[];

int func_ov006_021ba1f8(char *self) {
    int i;
    char *p;

    *(int *)self = func_020211c8(data_020f8c60);
    func_0202147c();

    *(char *)(self + 0x154) = 0;
    func_0202227c(0, self + 0x154);

    p = self + 0x174;
    for (i = 0; i < 0x28; i++) {
        *p = 0;
        func_0202227c(i + 1, p);
        p += 0x20;
    }

    func_ov006_021bbdc0(self);
    func_ov006_021bbe7c(self);
    func_ov006_021bc0cc(self);
    func_ov006_021be6f4(self);
    func_ov006_021bc45c(self, 1, 1, 1, 1);

    if (*(int *)(self + 0x40) == 1) {
        func_ov006_021bcb94(self, 1, 1);
    }
    func_ov006_021bcedc(self, 1, 1);
    func_ov006_021beec4(self);

    switch (*(int *)(self + 0x40)) {
    case 1:
        func_ov006_021bf01c(self);
        break;
    case 2:
        func_ov006_021bf2a4(self);
        break;
    case 5:
        func_ov006_021bf454(self);
        break;
    case 6:
        func_ov006_021bf4fc(self);
        func_ov006_021bf5e4(self);
        break;
    case 0:
    case 3:
    case 4:
    default:
        func_ov006_021bef6c(self);
        break;
    }

    func_ov006_021bf844(self);
    func_ov006_021c0c14(self);
    func_ov006_021c0dc8(self);
    func_ov006_021bee68(self, 1);
    func_ov006_021c11c8(self);

    *(int *)(data_021040ac + 0x1c) = 1;

    return 1;
}
