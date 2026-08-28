/* func_ov006_021ba0f8: object init — set up handle, clear the "slot -1"
 * mailbox + 40 general mailbox slots (field_174, stride 0x20), then run a
 * fixed setup-call sequence gated by the object's mode word (self+0x40),
 * dispatch a per-mode "enter" call via a 7-way jump table, then a fixed
 * teardown-call sequence and a global flag set.
 */
extern int func_02021174(void *);
extern void func_02021428(void);
extern void func_02022228(int, void *);
extern void func_ov006_021bbcb4(void *self);
extern void func_ov006_021bbd70(void *self);
extern void func_ov006_021bbfc0(void *self);
extern void func_ov006_021be5e8(void *self);
extern void func_ov006_021bc350(void *self, int, int, int, int);
extern void func_ov006_021bca88(void *self, int, int);
extern void func_ov006_021bcdd0(void *self, int, int);
extern void func_ov006_021bedb8(void *self);
extern void func_ov006_021bef10(void *self);
extern void func_ov006_021bf198(void *self);
extern void func_ov006_021bf348(void *self);
extern void func_ov006_021bf3f0(void *self);
extern void func_ov006_021bf4d8(void *self);
extern void func_ov006_021bee60(void *self);
extern void func_ov006_021bf738(void *self);
extern void func_ov006_021c0b08(void *self);
extern void func_ov006_021c0cbc(void *self);
extern void func_ov006_021bed5c(void *self, int);
extern void func_ov006_021c10bc(void *self);
extern char data_020f8b80[];
extern char data_02103fcc[];

int func_ov006_021ba0f8(char *self) {
    int i;
    char *p;

    *(int *)self = func_02021174(data_020f8b80);
    func_02021428();

    *(char *)(self + 0x154) = 0;
    func_02022228(0, self + 0x154);

    p = self + 0x174;
    for (i = 0; i < 0x28; i++) {
        *p = 0;
        func_02022228(i + 1, p);
        p += 0x20;
    }

    func_ov006_021bbcb4(self);
    func_ov006_021bbd70(self);
    func_ov006_021bbfc0(self);
    func_ov006_021be5e8(self);
    func_ov006_021bc350(self, 1, 1, 1, 1);

    if (*(int *)(self + 0x40) == 1) {
        func_ov006_021bca88(self, 1, 1);
    }
    func_ov006_021bcdd0(self, 1, 1);
    func_ov006_021bedb8(self);

    switch (*(int *)(self + 0x40)) {
    case 1:
        func_ov006_021bef10(self);
        break;
    case 2:
        func_ov006_021bf198(self);
        break;
    case 5:
        func_ov006_021bf348(self);
        break;
    case 6:
        func_ov006_021bf3f0(self);
        func_ov006_021bf4d8(self);
        break;
    case 0:
    case 3:
    case 4:
    default:
        func_ov006_021bee60(self);
        break;
    }

    func_ov006_021bf738(self);
    func_ov006_021c0b08(self);
    func_ov006_021c0cbc(self);
    func_ov006_021bed5c(self, 1);
    func_ov006_021c10bc(self);

    *(int *)(data_02103fcc + 0x1c) = 1;

    return 1;
}
