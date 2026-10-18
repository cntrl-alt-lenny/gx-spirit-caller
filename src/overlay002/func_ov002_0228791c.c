typedef unsigned short u16;
typedef unsigned char u8;
typedef unsigned int u32;

struct Self { u16 f0; u16 b0 : 1; u16 rest : 15; };
struct Info {
    u32 pad0 : 9;
    u32 a : 1;
    u32 pad1 : 6;
    u32 b : 1;
    u32 rest : 15;
};
struct Hdr {
    u8 pad[0x5d4];
    u32 count;
    u8 pad2[4];
    u8 type[1];
};

extern struct Hdr data_ov002_022ce288;
extern struct Info data_ov002_022ce884[];

int func_ov002_0228791c(struct Self *self) {
    u32 i;
    for (i = 0; i < data_ov002_022ce288.count; i++) {
        switch (data_ov002_022ce288.type[i]) {
        case 6:
        case 7:
        case 8:
        case 0x1f:
        case 0x20:
        case 0x21:
            if ((data_ov002_022ce884[i].a ^ data_ov002_022ce884[i].b) == self->b0) {
                return 0;
            }
            break;
        }
    }
    return 1;
}
