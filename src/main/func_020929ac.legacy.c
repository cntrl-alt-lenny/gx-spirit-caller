extern unsigned int func_02092c78(unsigned int idx);
extern unsigned int func_02092c8c(unsigned int idx);
extern void func_02092a34(unsigned int idx, unsigned int v);

unsigned int func_020929ac(unsigned int idx, unsigned int size, unsigned int alignment) {
    unsigned int start;
    unsigned int end;
    unsigned int mask;
    start = func_02092c78(idx);
    if (start == 0) return 0;
    mask = ~(alignment - 1);
    start = (start + alignment - 1) & mask;
    end = start + size;
    end += alignment;
    end = mask & (end - 1);
    if (end > func_02092c8c(idx)) return 0;
    func_02092a34(idx, end);
    return start;
}



