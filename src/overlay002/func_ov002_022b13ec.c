extern int data_ov002_022d016c[];
extern short data_ov002_022ca59c[];
extern short data_ov002_022ca59e[];
extern int func_ov002_022b0484(int);
extern int func_020b3870(int, int);

int func_ov002_022b13ec(int arg)
{
    int value;
    int factor;
    switch (data_ov002_022d016c[0x340]) {
    case 1:
        if (data_ov002_022d016c[0x341] == 3 && arg > 0)
            return 0;
        break;
    case 2:
    case 3:
        if (arg > 5)
            return 0;
        break;
    }
    value = func_ov002_022b0484(arg);
    if (value >= data_ov002_022ca59c[arg * 2]) {
        factor = data_ov002_022ca59e[arg * 2];
        factor = factor > 0 ? value * factor : func_020b3870(value, -factor);
        return factor;
    }
    return 0;
}


