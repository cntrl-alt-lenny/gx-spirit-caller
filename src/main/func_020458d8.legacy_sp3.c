extern void func_0204067c(void *p);

extern int data_020ff890;
extern int data_020ff8b8;
extern int data_020ff8dc;

void func_020458d8(int sel) {
    switch (sel) {
    case 0:
        func_0204067c(&data_020ff890);
        break;
    case 1:
        func_0204067c(&data_020ff8b8);
        break;
    case 2:
        func_0204067c(&data_020ff8dc);
        break;
    }
}
