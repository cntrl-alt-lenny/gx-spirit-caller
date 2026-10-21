typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
extern u16 data_0219eed0;
extern u32 data_0219ef1c;
extern void func_02073318(void *header, u32 prefix, void *data, u32 length, u32 address, u32 offset);
#define SWAP(x) (((x) >> 8) | ((x) << 8))
void func_020730fc(void *header, u32 length, void *data, u32 size, u32 address, u8 protocol) {
    u8 *p = header;
    u16 offset = 0;
    u8 *cursor;
    u16 n;
    p[-20] = 0x45;
    p[-19] = 0;
    data_0219eed0++;
    n = data_0219eed0;
    *(u16 *)(p - 16) = SWAP(n);
    p[-12] = 0x80;
    p[-11] = protocol;
    n = (u16)(data_0219ef1c >> 16);
    *(u16 *)(p - 8) = SWAP(n);
    n = (u16)data_0219ef1c;
    *(u16 *)(p - 6) = SWAP(n);
    n = (u16)(address >> 16);
    *(u16 *)(p - 4) = SWAP(n);
    n = (u16)address;
    *(u16 *)(p - 2) = SWAP(n);
    if (length > 0x5c8) {
        cursor = p;
        while (length > 0x5c8) {
            func_02073318(p, 0, cursor, 0x5c8, address, offset | 0x2000);
            length -= 0x5c8;
            cursor += 0x5c8;
            offset += 0xb9;
        }
        if (length != 0) {
            if (size != 0) {
                func_02073318(p, 0, cursor, length, address, offset | 0x2000);
            } else {
                func_02073318(p, 0, cursor, length, address, offset);
            }
            offset += length >> 3;
            length = 0;
        }
    }
    if (length + size > 0x5c8) {
        do {
            u32 amount = 0x5c8 - length;
            func_02073318(p, length, data, amount, address, offset | 0x2000);
            size -= amount;
            length = 0;
            data = (u8 *)data + amount;
            offset += 0xb9;
        } while (size > 0x5c8);
    }
    if (length + size == 0) return;
    func_02073318(p, length, data, size, address, offset);
}


