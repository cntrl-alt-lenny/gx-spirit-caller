struct Low8 { unsigned int b : 8; };

extern char *GetSystemWork(void);

void func_0201aabc(int id) {
    char *w = GetSystemWork();

    ((struct Low8 *)(w + 0x900))->b |= 1 << (id - 0x75);
}
