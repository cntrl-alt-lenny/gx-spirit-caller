extern char *data_0219e30c;

extern int func_02046804(int arg0);
extern unsigned char func_020522c0(int idx);
extern unsigned int func_020526b8(int arg1);
extern void func_02052024(int idx, int arg1, int arg2);
extern void func_02051f24(int idx, int arg1, int arg2);
extern void func_02051ed4(int idx, int arg1, int arg2);
extern void func_0204520c(int a0, int a1);

/* func_020521a4: idx = func_02046804(arg0); dispatches on
 * func_020522c0(idx) (the record's byte-0x1d flag, values 0..4) into
 * one of 5 per-mode handlers, default arms a (6, 0xfffe82b6) latch.
 */
void func_020521a4(int arg0, int arg1, int arg2) {
    int idx = func_02046804(arg0);

    switch (func_020522c0(idx)) {
    case 0: {
        unsigned int r = func_020526b8(arg1);
        if (r < 2 || r > 4) {
            return;
        }
        func_02052024(idx, arg1, arg2);
        return;
    }
    case 1:
        func_02052024(idx, arg1, arg2);
        return;
    case 2:
        func_02051f24(idx, arg1, arg2);
        return;
    case 3:
        func_02051ed4(idx, arg1, arg2);
        return;
    case 4:
        *(unsigned char *)(data_0219e30c + idx * 0x30 + 0x1d) = 1;
        *(int *)(data_0219e30c + idx * 0x30 + 0x10) = 0;
        *(int *)(data_0219e30c + idx * 0x30 + 0x18) = 0;
        return;
    default:
        func_0204520c(6, (int)0xfffe82b6);
        return;
    }
}
