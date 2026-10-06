extern int data_021a662c;
extern unsigned int func_02092368(void);
void *func_02092a5c(unsigned int area) {
    switch (area) {
    case 0: return (void *)0x022d2980;
    case 2: if (!data_021a662c || (func_02092368() & 3) == 1) return 0; return (void *)0x023e0000;
    case 3: return (void *)0x01ff8880;
    case 4: return (void *)0x027e0620;
    case 5: return (void *)0x027ff000;
    case 6: return (void *)0x037f8000;
    default: return 0;
    }
}
