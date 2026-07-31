/* func_ov002_022b3784: stash idx/val/mode into self's fields, launch
 * a func_02006c0c task (via func_0201d47c/func_0201e5b8 setup) unless
 * mode==5, then dispatch on self->f58 to func_02037208 with a per-case
 * constant pair.
 */

extern int data_ov002_022ccb8c;
extern int data_ov002_022ccba8;
extern int func_02006c0c(int *data, int a, int b);
extern void func_0201d47c(void *out);
extern void func_0201e5b8(void *in);
extern void Task_Invoke(int task);
extern void func_02037208(int a, int b, int c, int d);

void func_ov002_022b3784(char *self, int idx, int val, int mode) {
    char *p;
    char local[0x28];

    if (val == 0) return;

    p = self + idx * 4;
    *(int *)(p + 0x4c) = val;
    *(int *)(self + 0x58) = mode;
    *(int *)(self + 0x54) = 0x100;

    if (mode != 4) *(int *)(p + 0x44) = val;

    if (mode != 5) {
        int task;
        unsigned short v;
        int *dataPtr;

        if (mode == 0) dataPtr = &data_ov002_022ccb8c;
        else dataPtr = &data_ov002_022ccba8;
        task = func_02006c0c(dataPtr, 4, 0);

        func_0201d47c(local);
        v = *(unsigned short *)(local + 0x14);
        v = (v & ~0xf) | 4;
        *(int *)(local + 0) = task;
        *(unsigned short *)(local + 0x14) = v;
        *(int *)(local + 0xc) = 0x4780;
        *(unsigned short *)(local + 0x10) = 0;
        func_0201e5b8(local);
        Task_Invoke(task);
    }

    switch (*(int *)(self + 0x58)) {
    case 1:
    case 2: {
        int a = 0x39;
        int b = a - 0x3a;
        func_02037208(a, b, 0, 1);
        return;
    }
    case 3: {
        int a = 0x4b;
        int b = a - 0x4c;
        func_02037208(a, b, 0, 1);
        return;
    }
    case 0: {
        int a = 0x40;
        int b = a - 0x41;
        func_02037208(a, b, 0, 1);
        break;
    }
    default:
        break;
    }
}
