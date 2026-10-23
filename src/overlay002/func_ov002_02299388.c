struct State { int pad[2]; int phase; int pad2[112]; int flag; };
extern struct State data_ov002_022cd524;
extern int data_ov002_022d016c[];
extern char data_ov002_022cf288[];
extern int func_ov002_021bae7c(int player, int id, int except);
extern int func_ov002_021c9c94(int arg0);
extern int func_ov002_021c9e14(int arg0);
extern int func_ov002_0227c630(int a);
/* The existing void definition omits the return value tested by this caller. */
extern int func_ov002_0227d660(int self, int arg);
extern int func_ov002_02280980(int arg0);
extern int func_ov002_02285d68(int a);

extern int func_ov002_02285e28(int a, int mode);
extern int func_ov002_022864d0(int player, int *out);
/* The existing pointer parameters represent the integer player used here. */
extern int func_ov002_02297c3c(int thing);
extern int func_ov002_02297d68(int a);
extern int func_ov002_02298dcc(int a, int b, int c);
extern int func_ov002_02298f78(int a);

int func_ov002_02299388(void)
{
    int a = data_ov002_022d016c[0x33b];
    int out;
    int b;
    int result;
    switch (data_ov002_022cd524.phase) {
    case 0:
        data_ov002_022cd524.flag = 0;
        if (data_ov002_022d016c[0x33c] == 0) return 1;
        if (((*(unsigned int *)(data_ov002_022cf288 + (a & 1) * 0x868) >> 17) & 1) ||
            !func_ov002_0227c630(a) ||
            (!func_ov002_021c9e14(a) && !func_ov002_021c9c94(a)) ||
            func_ov002_021bae7c(1-a, 0x1102, -1) > 0) {
            data_ov002_022cd524.phase++;
            return 0;
        }
        if (func_ov002_02298f78(a)) return 0;
        if (func_ov002_021c9e14(a)) {
            b = -1;
            if (func_ov002_0227d660(a, 1) >= 0) {
                b = func_ov002_02285e28(a, 1);
            } else if (func_ov002_02285d68(a)) {
                b = func_ov002_02285e28(a, 0);
            }
            if (b == -1) b = func_ov002_02285e28(a, -1);
            if (b >= 0) {
                if (func_ov002_02298dcc(a, b, 0) == 0) return 0;
            }
        }
        data_ov002_022cd524.phase++;
        return 0;
    case 1:
        if (func_ov002_02280980(a) >= 0) {
            if (func_ov002_02285d68(a)) return 1;
        }
        data_ov002_022cd524.phase++;
        return 0;
    case 2:
        if (func_ov002_02297d68(a)) {
            data_ov002_022cd524.phase = 0;
            return 0;
        }
        data_ov002_022cd524.phase++;
        return 0;
    case 3:
        if (func_ov002_02297c3c(a)) {
            data_ov002_022cd524.phase = 0;
            return 0;
        }
        data_ov002_022cd524.phase++;
        return 0;
    case 4:
        if (!func_ov002_0227c630(a) ||
            ((*(unsigned int *)(data_ov002_022cf288 + (a & 1) * 0x868) >> 17) & 1) ||
            (!func_ov002_021c9e14(a) && !func_ov002_021c9c94(a))) {
            data_ov002_022cd524.phase++;
            return 0;
        }
        b = func_ov002_022864d0(a, &out);
        if (b >= 0 && out == 0) {
            result = func_ov002_02298dcc(a, b, 0);
            if (result == 0) return 0;
            if (result > 0) {
                data_ov002_022cd524.phase = 1;
                return 0;
            }
        }
        return 1;
    default:
        return 1;
    }
}





