typedef struct {
    char _pad[0xd0b];
    unsigned char field : 2;
} S_0203d6c4;

int func_0203d6c4(S_0203d6c4 *p) {
    return (p->field == 1) ? 0x30000 : 0x20000;
}
