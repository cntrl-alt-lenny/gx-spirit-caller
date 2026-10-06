void func_02072444(unsigned char *packet, void *connection)
{
    int remaining;
    unsigned char *option = packet + 20;
    *(unsigned short *)((char *)connection + 0x2e) = 536;
    remaining = (packet[12] & 0xf0) / 4 - 20;
    while (remaining-- != 0) {
        switch (*option++) {
        case 0: return;
        case 1: break;
        case 2:
            *(unsigned short *)((char *)connection + 0x2e) = (option[1] << 8) | option[2];
            option += 3;
            remaining -= 3;
            break;
        default: {
            int size = *option - 1;
            remaining -= size;
            option += size;
            break;
        }
        }
    }
}
