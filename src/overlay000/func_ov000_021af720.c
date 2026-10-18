struct Settings {
    unsigned int pad0[2];
    int result;
    unsigned int pad1[7];
    unsigned int low : 12;
    unsigned int first : 8;
    unsigned int second : 8;
    unsigned int high : 4;
    unsigned int third : 5;
};
extern struct Settings data_ov000_021c758c;
extern void func_ov000_021b11d0_unk(unsigned int, unsigned int, unsigned int, int, void *);
extern int func_02006c0c(void *, int, int);
void func_ov000_021af720(void) {
    char buffer[32];
    func_ov000_021b11d0_unk(data_ov000_021c758c.first, data_ov000_021c758c.second, data_ov000_021c758c.third, 0, buffer);
    data_ov000_021c758c.result = func_02006c0c(buffer, 4, 0);
}
