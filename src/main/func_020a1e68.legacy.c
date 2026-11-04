extern unsigned int data_020c3630[];
extern int func_020a1f7c(int index, unsigned int address, unsigned int size);

int func_020a1e68(int index, unsigned int address, unsigned int size)
{
    switch (data_020c3630[index]) {
    case 0:
    case 2:
        return func_020a1f7c(index, address, size);
    case 1:
        if (address >= 0x02000000 && address < 0x023fe800) {
            unsigned int end = address + size;
            if (address < 0x02300000 && end > 0x02300000)
                return 0;
            if (end <= 0x02300000)
                return 1;
            if (end < 0x023fe800 && size <= 0x40000)
                return 1;
            return 0;
        }
        if (address >= 0x037f8000 && address < 0x0380f000) {
            return (address + size <= 0x0380f000) ? 1 : 0;
        }
        break;
    default:
        return 0;
    }
    return 0;
}
