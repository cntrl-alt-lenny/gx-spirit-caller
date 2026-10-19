typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 13;
    unsigned short bit14 : 1;
    unsigned short pad15 : 1;
} S021ff3bc;
typedef struct { char pad[0x5b4]; int state; } State;
typedef struct { char pad[12]; unsigned int count; char rest[0x858]; } Entry;
extern int func_ov002_021ff3bc(S021ff3bc *, int);
extern int func_ov002_021f4a84(S021ff3bc *, int);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0226b094(int arg0, int arg1);
extern State data_ov002_022ce288;
extern Entry data_ov002_022cf16c[];
typedef struct { unsigned int count; char rest[0x864]; } CountEntry;
extern CountEntry data_ov002_022cf178[];
int func_ov002_021f980c(S021ff3bc *p, int arg) {
    int side = p->bit0 ^ p->bit14;
    unsigned int i;
    if (func_ov002_021ff3bc(p, arg) == 0) return -1;
    i = 0;
    if (i < data_ov002_022cf178[side & 1].count) do {
        if (func_ov002_022536e8((void *)side, p->w0, i) != 0)
            return func_ov002_021f4a84(p, arg);
        i++;
    } while (i < data_ov002_022cf16c[side & 1].count);
    switch (data_ov002_022ce288.state) {
    case 0:
        func_ov002_021ae400(side, 0x122);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        func_ov002_0226b094(1 - side, 0x10d6);
        return -1;
    }
    return -1;
}




