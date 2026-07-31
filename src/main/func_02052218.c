extern char *data_0219e3ec;

extern int func_02046870(int arg0);
extern unsigned char func_02052334(int idx);
extern unsigned int func_0205272c(int arg1);
extern void func_02052098(int idx, int arg1, int arg2);
extern void func_02051f98(int idx, int arg1, int arg2);
extern void func_02051f48(int idx, int arg1, int arg2);
extern void func_0204525c(int a0, int a1);

/* func_02052218: idx = func_02046870(arg0); dispatches on
 * func_02052334(idx) (the record's byte-0x1d flag, values 0..4) into
 * one of 5 per-mode handlers, default arms a (6, 0xfffe82b6) latch.
 */
void func_02052218(int arg0, int arg1, int arg2) {
    int idx = func_02046870(arg0);

    switch (func_02052334(idx)) {
    case 0: {
        unsigned int r = func_0205272c(arg1);
        if (r < 2 || r > 4) {
            return;
        }
        func_02052098(idx, arg1, arg2);
        return;
    }
    case 1:
        func_02052098(idx, arg1, arg2);
        return;
    case 2:
        func_02051f98(idx, arg1, arg2);
        return;
    case 3:
        func_02051f48(idx, arg1, arg2);
        return;
    case 4:
        *(unsigned char *)(data_0219e3ec + idx * 0x30 + 0x1d) = 1;
        *(int *)(data_0219e3ec + idx * 0x30 + 0x10) = 0;
        *(int *)(data_0219e3ec + idx * 0x30 + 0x18) = 0;
        return;
    default:
        func_0204525c(6, (int)0xfffe82b6);
        return;
    }
}
