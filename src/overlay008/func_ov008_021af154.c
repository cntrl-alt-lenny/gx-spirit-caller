extern char data_ov008_021b2780[];
typedef struct { unsigned short first; char pad[166]; unsigned short count; } State;
extern State data_ov008_021b2de4;
extern int func_ov008_021aedfc(int thr);
extern int func_ov008_021aee54(int thr);
extern void func_ov008_021aefd4(int row, int slot);
extern void func_ov008_021af0a8(int index, int slot);
void func_ov008_021af154(int count, int direction) {
    int slot, i, offset, bit, row;
    if (direction) {
        for (i = count - 1; i >= 0; i--) {
            offset = 3 - i;
            slot = data_ov008_021b2de4.first % 5 + offset;
            if (slot >= 5) slot -= 5;
            if (data_ov008_021b2de4.first + offset < data_ov008_021b2de4.count) {
                func_ov008_021aefd4(func_ov008_021aedfc(data_ov008_021b2de4.first + offset), slot);
                bit = func_ov008_021aee54(data_ov008_021b2de4.first + offset);
                row = func_ov008_021aedfc(data_ov008_021b2de4.first + offset);
                if (((unsigned int *)(data_ov008_021b2780 + row * 52 + 60))[func_ov008_021aee54(data_ov008_021b2de4.first + offset) / 32] & (1 << (bit % 32)))
                    func_ov008_021af0a8(data_ov008_021b2de4.first + offset, slot);
            }
        }
    } else {
        for (i = 0; i < count; i++) {
            slot = data_ov008_021b2de4.first % 5 - 1 + i;
            if (slot < 0) slot += 5;
            if (slot >= 5) slot -= 5;
            if (data_ov008_021b2de4.first - 1 + i >= 0) {
                func_ov008_021aefd4(func_ov008_021aedfc(data_ov008_021b2de4.first - 1 + i), slot);
                bit = func_ov008_021aee54(data_ov008_021b2de4.first - 1 + i);
                row = func_ov008_021aedfc(data_ov008_021b2de4.first - 1 + i);
                if (((unsigned int *)(data_ov008_021b2780 + row * 52 + 60))[func_ov008_021aee54(data_ov008_021b2de4.first - 1 + i) / 32] & (1 << (bit % 32)))
                    func_ov008_021af0a8(data_ov008_021b2de4.first - 1 + i, slot);
            }
        }
    }
}

