#include <nitro/os_thread.h>
extern unsigned int data_0218febc[];
extern char data_0218fedc[];
extern unsigned short data_0218ff0c[];
extern char data_0219020c[];
extern void func_020927b8(char *self);
extern void func_02092748(OSMutex *mutex);
extern void func_020944a4(int unused0, int unused1, int unused2);
void func_0201cab4(unsigned short *src, int size, int append)
{
    char *dst;
    unsigned int i, end;
    func_020927b8(data_0218fedc);
    i = data_0218febc[7];
    dst = data_0219020c;
    end = data_0218febc[0];
    while (i != end) {
        dst += data_0218ff0c[i];
        i = (i + 1) & 31;
    }
    if (append) {
        func_020944a4((int)(src + 1), (int)(dst + (data_0218ff0c[end] + 2)), size - 2);
        data_0218ff0c[data_0218febc[0]] += size - 2;
    } else {
        if (data_0218ff0c[end]) {
            func_020944a4((int)(src + 1), (int)(dst + (data_0218ff0c[end] + 2)), size - 2);
            *(unsigned short *)dst = *src;
        } else {
            func_020944a4((int)src, (int)dst, size);
        }
        data_0218ff0c[data_0218febc[0]] += size;
        data_0218febc[0] = (data_0218febc[0] + 1) & 31;
    }
    func_02092748((OSMutex *)data_0218fedc);
}
