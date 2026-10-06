extern void func_02093bfc(unsigned int);
void func_02093c90(int channel, unsigned int mode) {
    int index;
    unsigned int *control = (unsigned int *)0x040000b8;
    for (index = 0; index < 3; index++, control += 3) {
        unsigned int value, current;
        if (index == channel) continue;
        value = *(volatile unsigned int *)control;
        if (!(value & 0x80000000)) continue;
        current = value & 0x38000000;
        if (current == mode) continue;
        if (current == 0x08000000 && mode == 0x10000000) continue;
        if (current == 0x10000000 && mode == 0x08000000) continue;
        if (current == 0x18000000 || current == 0x20000000 || current == 0x28000000 || current == 0x30000000 || current == 0x38000000 || current == 0x08000000 || current == 0x10000000) func_02093bfc(current);
    }
}
