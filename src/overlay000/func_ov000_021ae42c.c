typedef struct {
    unsigned int low : 12;
    unsigned int value : 4;
    unsigned int high : 16;
} Field;
typedef struct {
    char pad[0x2a4];
    unsigned int flags;
    Field selection;
} State;
extern State data_ov000_021c758c;
extern void func_ov000_021ae510(unsigned int value);
void func_ov000_021ae42c(unsigned int value) {
    data_ov000_021c758c.selection.value = value;
    data_ov000_021c758c.flags = (data_ov000_021c758c.flags & 0xffe01fff) | 0x2000;
    func_ov000_021ae510(data_ov000_021c758c.selection.value);
}
