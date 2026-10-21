typedef struct { char pad[0xcf0]; unsigned int cf0; char pad2[0x50]; int d44; char pad3[8]; int d50; char pad4[0x14]; int d68; int d6c; int d70; } State;
extern State data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021ae484(int x);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);

void func_ov002_022585dc(void)
{
    switch (data_ov002_022d016c.d68) {
    case 0:
        if (data_ov002_022d016c.cf0 + 1 < 10) {
            func_ov002_021ae400(data_ov002_022d016c.d6c, 0x52);
            data_ov002_022d016c.d50 = 0;
        } else {
            func_ov002_021ae484(6);
            data_ov002_022d016c.d68 = data_ov002_022d016c.d68 + 1;
        }
        break;
    case 1:
        if (data_ov002_022d016c.d44 != 0) {
            func_ov002_021d479c((unsigned short)((data_ov002_022d016c.d70 != 0 ? 0x8000 : 0) | 0x23), 10, 0, 0);
        }
        data_ov002_022d016c.d50 = 0;
        break;
    }
}


