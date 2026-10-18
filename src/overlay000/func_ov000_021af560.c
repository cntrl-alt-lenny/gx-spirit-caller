struct Settings {
    unsigned int pad[10];
    unsigned int low : 12;
    unsigned int first : 8;
    unsigned int second : 8;
    unsigned int high : 4;
    unsigned int third : 5;
};
extern struct Settings data_ov000_021c758c;
extern void func_ov000_021b0b38_unk(void);
void func_ov000_021af560(int a, int b, int c) {
    func_ov000_021b0b38_unk();
    data_ov000_021c758c.first = (unsigned char)a;
    data_ov000_021c758c.second = (unsigned char)b;
    data_ov000_021c758c.third = (unsigned char)c;
}
