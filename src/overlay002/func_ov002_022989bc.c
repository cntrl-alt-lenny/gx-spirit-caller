typedef struct { int a; int b; } Rec;
extern int data_ov002_022cd524[];
extern char data_ov002_022d016c[];
extern Rec data_ov002_022c9250[];

extern int func_ov002_02297158(int, Rec *);
extern int func_ov002_021bd09c(int);
extern int func_ov002_021c9c48(int);
extern int func_ov002_022819d4(int);
extern int func_ov002_022979bc(int, int);
extern int func_ov002_02298768(int);

int func_ov002_022989bc(void)
{
    int p = *(int *)(data_ov002_022d016c + 0xcec);
    unsigned int i;

    switch (data_ov002_022cd524[2]) {
    case 0:
        for (i = 0; i < 0x57; i++) {
            if (func_ov002_02297158(p, &data_ov002_022c9250[i]) != 0) {
                return 0;
            }
        }
        data_ov002_022cd524[2]++;
    case 1:
        if (func_ov002_021bd09c(p) >= 2 && func_ov002_021c9c48(p) != 0
            && func_ov002_022819d4(p) != 0 && func_ov002_022979bc(p, 1) != 0) {
            if (func_ov002_02298768(p) != 0) {
                return 0;
            }
        }
        return 1;
    default:
        return 1;
    }
}
