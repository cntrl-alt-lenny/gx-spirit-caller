typedef unsigned short u16;
typedef unsigned int u32;
struct Card { u16 id; u16 side:1, zone:5, kind:6, mode:2, flip:1, rest:1; u32 pad[4]; u32 value; };
struct State { char pad[0x5d4]; u32 count; u32 unused; unsigned char kinds[32]; u32 values[32]; };
extern struct State data_ov002_022ce288;
int func_ov002_021fdc08(struct Card *self) {
    u32 i;
    struct State *cursor;
    u32 kind = self->kind;
    u32 value;
    u32 count;
    switch(kind) {
    case 6: case 7: case 8: case 11: case 12: case 22: case 25: case 26: case 27: case 28: case 29: case 30:
        value = self->value & 0x1ff;
        break;
    default: return 0;
    }
    cursor = &data_ov002_022ce288;
    count = cursor->count;
    for(i=0; i<count; i++, cursor=(struct State *)((char *)cursor+1)) {
        if(kind == cursor->kinds[0]) {
            switch(cursor->kinds[0]) {
            case 6: case 7: case 8: case 11: case 12: case 22: case 25: case 26: case 27: case 28: case 29: case 30:
                if(value == (data_ov002_022ce288.values[i] & 0x1ff)) return 0;
                break;
            }
        }
    }
    return 1;
}





