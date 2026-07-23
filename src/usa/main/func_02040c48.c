extern void func_020445c0(void *out);
extern void func_02040988(void *a, void *buf);

void func_02040c48(void *a) {
    char buffer[0x18];
    func_020445c0(buffer);
    func_02040988(a, buffer);
}
