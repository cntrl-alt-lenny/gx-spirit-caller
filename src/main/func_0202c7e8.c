void func_0202c7e8(unsigned int layer, unsigned int x, unsigned int y)
{
    switch (layer) {
    case 0: *(unsigned int *)0x04000010 = (x & 0x1ff) | ((y << 16) & 0x1ff0000); break;
    case 1: *(unsigned int *)0x04000014 = (x & 0x1ff) | ((y << 16) & 0x1ff0000); break;
    case 2: *(unsigned int *)0x04000018 = (x & 0x1ff) | ((y << 16) & 0x1ff0000); break;
    case 3: *(unsigned int *)0x0400001c = (x & 0x1ff) | ((y << 16) & 0x1ff0000); break;
    case 5: *(unsigned int *)0x04001010 = (x & 0x1ff) | ((y << 16) & 0x1ff0000); break;
    case 6: *(unsigned int *)0x04001014 = (x & 0x1ff) | ((y << 16) & 0x1ff0000); break;
    case 7: *(unsigned int *)0x04001018 = (x & 0x1ff) | ((y << 16) & 0x1ff0000); break;
    case 8: *(unsigned int *)0x0400101c = (x & 0x1ff) | ((y << 16) & 0x1ff0000); break;
    }
}

