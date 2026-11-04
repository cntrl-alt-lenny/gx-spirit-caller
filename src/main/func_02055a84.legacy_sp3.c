#include <nitro/types.h>
extern char data_020ffc10[], data_020ffc40[], data_020ffc4c[], data_020ffd04[], data_020ffd14[], data_020ffd20[], data_020ffd30[];
extern void func_02058038(void *a0, void *a1, int unused2);
extern void func_02058070(int a, int b, int c);
extern int func_0205ffc0(int *p, int b);
extern void func_020604b0(char *dst, char *src, int n);
typedef struct State {
    char pad0[0x108];
    int busy;
    char pad1[0x8c];
    int value;
    char pad2[0x3c];
    int status;
} State;
int func_02055a84(int *self, int mode, char *path) {
    int state;
    char a[0x401];
    char *p;
    if (self == 0 || (state = *self) == 0) return 2;
    if (((State *)state)->busy != 0) return 0;
    if (((State *)state)->status == 4) {
        func_0205ffc0((int *)self, (int)data_020ffc10);
        return 2;
    }
    if (path == 0) {
        func_0205ffc0((int *)self, (int)data_020ffd04);
        return 2;
    }
    func_020604b0(a, path, 0x401);
    if (*a) {
        p = a;
        do {
            if (*p == '\\') *p = '/';
        } while (*++p);
    }
    func_02058070((int)self, state + 0x1f4, (int)data_020ffd14);
    func_02058070((int)self, state + 0x1f4, (int)data_020ffc40);
    func_02058038(self, (void *)(state + 0x1f4), ((State *)state)->value);
    func_02058070((int)self, state + 0x1f4, (int)data_020ffd20);
    func_02058038(self, (void *)(state + 0x1f4), mode);
    func_02058070((int)self, state + 0x1f4, (int)data_020ffd30);
    func_02058070((int)self, state + 0x1f4, (int)a);
    func_02058070((int)self, state + 0x1f4, (int)data_020ffc4c);
    return 0;
}
