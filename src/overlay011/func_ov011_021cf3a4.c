extern unsigned int func_ov011_021d0ffc(int arg0);
extern int func_ov011_021d1028(int arg0);

int func_ov011_021cf3a4(int arg0) {
    if (func_ov011_021d0ffc(arg0) == 1) {
        switch (func_ov011_021d1028(arg0)) {
        case 1:
        case 3:
            return 1;
        }
    }
    return 0;
}
