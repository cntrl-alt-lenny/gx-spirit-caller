typedef unsigned short u16;
typedef struct { u16 *value; int pad; } Output;
typedef struct { u16 ready; u16 pad[3]; } Flag;
typedef struct { int field_0; void (*field_4)(int, int); int field_8; unsigned int *field_c; } State;
extern Output data_021a8410[];
extern Flag data_021a840c[];
extern int data_021a83d0;
extern int data_021a83d4;
extern State data_021a83e4;
extern void func_0209b448(int a0);
void func_0209b298(int unused, unsigned int word, int error) {
    u16 command;
    u16 value;
    if (error != 0) {
        func_0209b448(2);
        return;
    }
    command = (word & 0x7f00) >> 8;
    value = word & 0xff;
    if (command >= 0x70 && command <= 0x74) {
        int index = command - 0x70;
        value = (u16)(value & 0xff);
        if (data_021a8410[index].value != 0) {
            *data_021a8410[index].value = value;
        }
        data_021a840c[index].ready = 1;
        value = 0;
    } else if (command == 0x60) {
        data_021a83d0 = 1;
    } else if (command == 0x62) {
        data_021a83d4 = 1;
    } else if (command == 0x67) {
        if (data_021a83e4.field_c != 0) {
            *data_021a83e4.field_c = value;
        }
        value = 0;
    }
    func_0209b448(value);
}

