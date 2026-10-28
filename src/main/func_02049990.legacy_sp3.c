extern void *func_020498f0(void);
extern void func_020498dc(int);
extern int func_02049910(int);
extern int func_0204a8bc(int);
extern int func_0204a960(int);
extern int func_0204a9b0(int);
extern int func_0204cb54(int);
extern int func_0204cc20(int);
extern int func_0204ec90(void *);
extern int func_02062600(int, void *, char *, char *, int, int, int, int);
extern char *func_02064f84(unsigned int, int, char *);
extern int OS_SNPrintf(char *, unsigned int, const char *, ...);
extern long long func_020930b0(void);
extern char data_020ff968[];
#define B(o) (*(unsigned char *)((char *)func_020498f0() + (o)))
#define W(o) (*(int *)((char *)func_020498f0() + (o)))
typedef struct { unsigned char kind, count; unsigned short port; unsigned int addr; int active; } Info;
typedef struct { char pad[0x210]; unsigned int addr[32]; unsigned short port[32]; } Table;
typedef struct { char pad[0xf4]; int entries[32]; } Entries;
void func_02049990(int code, int unused, Info *info, Info *self) {
    int index;
    char buf[12];
    if (W(0x1a0) != 6 && W(0x1a0) != 11) return;
    if (self == 0) return;
    if (code == 0) {
        self->active = 0;
        B(0x14)++;
        index = B(0x14);
        if (self->kind != 0) {
            unsigned short port;
            void *ctx;
            void *base;
            char *address;
            int result;
            ((Table *)func_020498f0())->addr[index] = info->addr;
            port = info->port;
            ((Table *)func_020498f0())->port[index] = ((port >> 8) & 0xff) | ((port << 8) & 0xff00);
            B(0x17c) = 0;
            W(0x180) = 0;
            ctx = func_020498f0();
            *(int *)((char *)ctx + 0x184) = 0;
            *(int *)((char *)ctx + 0x188) = 0;
            if (W(0x1a0) == 11) func_020498dc(12);
            else func_020498dc(7);
            B(0xc) = 0;
            OS_SNPrintf(buf, 12, data_020ff968, W(0x200));
            ctx = func_020498f0();
            base = func_020498f0();
            address = func_02064f84(((Table *)base)->addr[index], ((Table *)func_020498f0())->port[index], 0);
            result = func_02062600(**(int **)((char *)ctx + 4), 0, address, buf, -1, 5000, W(8), 0);
            if (result == 1) { func_0204a8bc(result); return; }
            if (result == 0) return;
            if (func_0204cc20(((Entries *)func_020498f0())->entries[index]) == 0) return;
        } else {
            void *ctx;
            long long time;
            if (info != 0) {
                unsigned short port;
                index = index - 1;
                ((Table *)func_020498f0())->addr[index] = info->addr;
                port = info->port;
                ((Table *)func_020498f0())->port[index] = ((port >> 8) & 0xff) | ((port << 8) & 0xff00);
            }
            ctx = func_020498f0();
            time = func_020930b0();
            *(long long *)((char *)ctx + 0x18c) = time;
            func_020498dc(7);
        }
    } else {
        int result;
        if (self->active == 0) return;
        result = func_0204a960(code);
        if (result != 2 && result != 1) return;
        if (self->kind == 0) {
            if (result == 1 || (result == 2 && self->count >= 1)) {
                void *ctx;
                self->active = 0;
                if (func_02049910(0) == 0) return;
                ctx = func_020498f0();
                if (func_0204cb54(((Entries *)ctx)->entries[B(0xd)]) == 0) return;
            } else {
                self->count++;
                if (func_0204a9b0(func_0204ec90(self)) == 0) return;
            }
        } else {
            void *ctx = func_020498f0();
            long long time = func_020930b0();
            *(long long *)((char *)ctx + 0x184) = time;
            if (result == 1 || (result == 2 && B(0x17c) >= 1)) {
                self->active = 0;
                if (B(0x15) == 3 || B(0x15) == 2) {
                    if (func_02049910(1) == 0) return;
                } else {
                    if (func_02049910(0) == 0) return;
                }
                B(0x17c) = 0;
                W(0x180) = 0;
                ctx = func_020498f0();
                *(int *)((char *)ctx + 0x184) = 0;
                *(int *)((char *)ctx + 0x188) = 0;
                ctx = func_020498f0();
                if (func_0204cc20(((Entries *)ctx)->entries[B(0xd) + 1]) == 0) return;
            }
        }
    }
}
