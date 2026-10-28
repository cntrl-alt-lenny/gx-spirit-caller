typedef struct {
    unsigned short flags;
    char pad[0x80a];
    int state;
    int count;
} State;
typedef struct {
    unsigned int id : 13;
    unsigned int other : 19;
    char pad[0x10];
} Entry;
typedef struct {
    char pad[0x30];
    Entry entries[10];
    char tail[0x770];
} Bank;
extern State data_ov002_022ce950;
extern Bank data_ov002_022cf16c[];
extern int data_ov002_022be10c[];
extern void func_ov002_0229ade0(int, int, int, int);
extern int func_ov002_0229c7f8(int arg);
void func_ov002_021d1974(void)
{
    int flag = (data_ov002_022ce950.flags & 0x8000) ? 1 : 0;
    if (data_ov002_022ce950.count == 0) {
        Bank *bank = &data_ov002_022cf16c[flag & 1];
        int i;
        for (i = 0; i < 5; i++) {
            int id = data_ov002_022be10c[i];
            int j;
            Entry *entry = &bank->entries[5];
            for (j = 5; j < 10; j++, entry++) {
                if (id == entry->id) {
                    func_ov002_0229ade0(0x3b, flag, j, (unsigned short)((i & 0xff) | 0x100));
                    break;
                }
            }
        }
        data_ov002_022ce950.count++;
    } else {
        if (func_ov002_0229c7f8(0x3b) == 0)
            data_ov002_022ce950.state = 0;
    }
}
