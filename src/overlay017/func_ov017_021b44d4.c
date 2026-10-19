typedef struct {
    unsigned int tag;
    unsigned short param;
} DrawCmd;

extern int func_02005dac(int a, int b);
extern asm void func_020944a4(void *buf, int handle, int count);

void func_ov017_021b44d4(int x, int flags, int code, int pal, int width)
{
    DrawCmd buf;
    int i;
    unsigned int hdr;
    int count = width / 32;
    i = 0;
    if (count <= 0) return;
    hdr = ((unsigned int)flags & 0xff) | 0x80004000;
    do {
        buf.tag = hdr | (((unsigned int)x << 23) >> 7);
        buf.param = code | (pal << 12);
        func_020944a4(&buf, func_02005dac(2, 0), 6);
        x += 32;
        code += 2;
    } while (++i < count);
}





