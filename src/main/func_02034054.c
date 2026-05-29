/* func_02034054: C23-noMMIO range check -> a1==0x4e85 || 0x59d8<=a1<=0x5dbf. */
int func_02034054(int a0, int a1) {
    return a1 == 0x4e85 || (a1 >= 0x59d8 && a1 <= 0x5dbf);
}
