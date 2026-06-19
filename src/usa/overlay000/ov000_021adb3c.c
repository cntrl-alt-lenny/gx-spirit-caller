/* func_ov000_021adb3c: clear int field at data_ov000_021c74ac + 0x20c. */

typedef struct {
    char _pad[0x20c];
    int field_20c;
} ov000_state_20c_t;

extern ov000_state_20c_t data_ov000_021c74ac;

void func_ov000_021adb3c(void) {
    data_ov000_021c74ac.field_20c = 0;
}
