extern void func_020944a4(const void *, void *, int);
typedef struct {
    unsigned char pad0[2];
    unsigned char mode:4; unsigned char reserved:4;
    unsigned char type, value;
    unsigned char pad1[0x64 - 5];
    unsigned short flag:3; unsigned short rest:13;
} BootConfig;
void func_020939a4(unsigned char *out) {
    BootConfig *config = (BootConfig *)0x027ffc80;
    out[0] = config->flag;
    out[1] = config->mode;
    out[2] = config->type;
    out[3] = config->value;
    *(unsigned short *)(out + 0x18) = *((unsigned char *)config + 0x1a);
    *(unsigned short *)(out + 0x4e) = *((unsigned char *)config + 0x50);
    func_020944a4((unsigned char *)config + 6, out + 4, 0x14);
    func_020944a4((unsigned char *)config + 0x1c, out + 0x1a, 0x34);
}
