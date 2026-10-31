extern unsigned int data_020c3630[];

int func_020a1f7c(int index, unsigned int address, unsigned int size)
{
    switch (data_020c3630[index]) {
    case 2:
        if (address >= 0x027ffe00 && address + size <= 0x027fff60)
            return 1;
        break;
    case 0:
        if (address >= 0x02000000 && address + size <= 0x022c0000)
            return 1;
        break;
    case 1:
        if (address >= 0x022c0000 && address + size <= 0x02300000)
            return 1;
        if (address >= 0x02000000 && address + size <= 0x02300000)
            return 1;
        break;
    default:
        return 0;
    }
    return 0;
}
