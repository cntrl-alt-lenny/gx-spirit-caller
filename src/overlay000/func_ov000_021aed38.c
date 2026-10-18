typedef struct {
    char pad[0x2ac];
    unsigned int : 22;
    unsigned int mode : 8;
    unsigned int : 2;
    unsigned int value : 8;
    unsigned int input : 8;
    unsigned int : 16;
} State;
extern State data_ov000_021c758c;
extern int func_020b3870(int, int);
void func_ov000_021aed38(int input, int divisor) {
    data_ov000_021c758c.input = input;
    data_ov000_021c758c.mode = 255;
    data_ov000_021c758c.value = func_020b3870(255, divisor);
}
