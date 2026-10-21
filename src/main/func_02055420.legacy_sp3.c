#include <nitro/types.h>
extern char data_020ffc10[], data_020ffc40[], data_020ffc4c[], data_020ffc78[], data_020ffc90[], data_020ffca8[], data_020ffcb4[], data_020ffcc4[];
extern void func_02058038(void *a0, void *a1, int unused2);
extern void func_02058070(int a, int b, int c);
extern int func_0205ffc0(int *p, int b);
extern void func_020604b0(char *dst, char *src, int n);
extern int func_020aaf40(const u8 *a, const u8 *b);
typedef struct State {
    char pad0[0x108];
    int busy;
    char pad1[0x8c];
    int value;
    char pad2[0x3c];
    int status;
    char pad3[0x18];
    char output[0x20];
    int mode;
    char first[0x100];
    char second[0x100];
} State;
int func_02055420(int *self, int mode, char *first, char *second) {
    int state;
    char a[0x100];
    char b[0x100];
    char *p;
    if (self == 0 || (state = *self) == 0) return 2;
    if (((State *)state)->busy != 0) return 0;
    if (((State *)state)->status == 4) {
        func_0205ffc0((int *)self, (int)data_020ffc10);
        return 2;
    }
    if (first == 0) {
        func_0205ffc0((int *)self, (int)data_020ffc78);
        return 2;
    }
    if (second == 0) {
        func_0205ffc0((int *)self, (int)data_020ffc90);
        return 2;
    }
    func_020604b0(a, first, 0x100);
    if (*a) {
        p = a;
        do {
            if (*p == '\\') *p = '/';
        } while (*++p);
    }
    func_020604b0(b, second, 0x100);
    if (*b) {
        p = b;
        do {
            if (*p == '\\') *p = '/';
        } while (*++p);
    }
    if (mode == ((State *)state)->mode && func_020aaf40((u8 *)a, (u8 *)((State *)state)->first) == 0 && func_020aaf40((u8 *)b, (u8 *)((State *)state)->second) == 0) return 0;
    ((State *)state)->mode = mode;
    func_020604b0(((State *)state)->first, a, 0x100);
    func_020604b0(((State *)state)->second, b, 0x100);
    func_02058070((int)self, state + 0x1f4, (int)data_020ffca8);
    func_02058038(self, (void *)(state + 0x1f4), mode);
    func_02058070((int)self, state + 0x1f4, (int)data_020ffc40);
    func_02058038(self, (void *)(state + 0x1f4), ((State *)state)->value);
    func_02058070((int)self, state + 0x1f4, (int)data_020ffcb4);
    func_02058070((int)self, state + 0x1f4, (int)a);
    func_02058070((int)self, state + 0x1f4, (int)data_020ffcc4);
    func_02058070((int)self, state + 0x1f4, (int)b);
    func_02058070((int)self, state + 0x1f4, (int)data_020ffc4c);
    return 0;
}


