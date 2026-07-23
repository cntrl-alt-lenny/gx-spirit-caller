extern void func_02044610(void *out);
extern void func_020409d8(void *a, void *buf);

void func_02040c98(void *a) {
    char buffer[0x18];
    func_02044610(buffer);
    func_020409d8(a, buffer);
}
