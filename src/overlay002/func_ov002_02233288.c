typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 a;
    u16 b : 1;
} Arg;

extern struct { char pad[0x5a8]; int mode; } data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern struct { char pad[0xb0]; u16 idx; } data_ov002_022d0e6c;

extern void func_ov002_0226af94(int, int, int);
extern void func_ov002_021d7c1c(int, void *, int);

int func_ov002_02233288(Arg *arg)
{
    int inv;

    switch (data_ov002_022ce288.mode) {
    case 0x80:
        if (*(int *)(data_ov002_022cf178 + ((1 - arg->b) & 1) * 0x868) == 0) {
            return 0;
        }
        func_ov002_0226af94(arg->b, arg->a, 1);
        return 0x7f;
    case 0x7f:
        inv = 1 - arg->b;
        func_ov002_021d7c1c(inv, data_ov002_022cf16c + (inv & 1) * 0x868 + 0x120 + data_ov002_022d0e6c.idx * 4, 1);
        return 0;
    }
    return 0;
}
