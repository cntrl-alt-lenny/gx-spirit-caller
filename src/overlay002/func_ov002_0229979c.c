extern int data_ov002_022cd708[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];
extern int func_ov002_0227b37c(int, int);
extern int func_ov002_021bd948(int, int);
extern int func_ov002_021bdc94(int a, int b);
extern void func_ov002_0227ab9c(int, int);
extern int func_ov002_021bb068(int);
/* The original caller supplies only two arguments to this four-parameter thunk. */
extern int func_ov002_021c84e0();
extern int func_ov002_021d6870(int, int, int, int, int, int);
int func_ov002_0229979c(int a, int b, int c)
{
    int mode = -1;
    if (c == 0) {
        if (data_ov002_022cd708[b] != 0) mode = 0;
    }
    if (mode == -1) mode = func_ov002_0227b37c(a,b);
    if (func_ov002_021bd948(a,b) == 0) return 0;
    if (mode == 0) {
        if (*(unsigned short *)(data_ov002_022cf1a4 + (a & 1) * 0x868 + b * 0x14) == 0) {
            if (func_ov002_021bdc94(a,b) != 0) {
                func_ov002_0227ab9c(a,b);
                return 1;
            }
        } else {
            if (*(unsigned short *)(data_ov002_022cf1a2 + (a & 1) * 0x868 + b * 0x14) != 0) {
                if (func_ov002_021bb068(0x17a6) != 0) {
                    if (func_ov002_021c84e0(a,b) >= 4) return 0;
                }
                func_ov002_021d6870(a,b,0,0,0,0);
                return 1;
            }
        }
    } else if (mode == 1) {
        if (*(unsigned short *)(data_ov002_022cf1a2 + (a & 1) * 0x868 + b * 0x14) == 0) {
            if (func_ov002_021bb068(0x15fb) != 0) return 0;
            if (func_ov002_021bb068(0x197b) != 0) {
                if (func_ov002_021c84e0(a,b) <= 3) return 0;
            }
            func_ov002_021d6870(a,b,0,0,0,0);
            return 1;
        }
    }
    return 0;
}

