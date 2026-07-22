extern void func_0204062c(void *p);

extern int data_020ff7b0;
extern int data_020ff7d8;
extern int data_020ff7fc;

void func_02045830(int sel) {
    switch (sel) {
    case 0:
        func_0204062c(&data_020ff7b0);
        break;
    case 1:
        func_0204062c(&data_020ff7d8);
        break;
    case 2:
        func_0204062c(&data_020ff7fc);
        break;
    }
}
