/* func_ov000_021adc1c: clear int field at data_ov000_021c758c + 0x20c. */

typedef struct {
    char _pad[0x20c];
    int field_20c;
} ov000_state_20c_t;

extern ov000_state_20c_t data_ov000_021c758c;

void func_ov000_021adc1c(void) {
    data_ov000_021c758c.field_20c = 0;
}
