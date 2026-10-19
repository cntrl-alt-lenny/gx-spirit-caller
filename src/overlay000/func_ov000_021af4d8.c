struct Source {
    unsigned int pad[11];
    unsigned int low : 13;
    unsigned int second : 8;
    unsigned int high : 11;
};
struct Settings {
    unsigned int pad[9];
    unsigned int low : 5;
    unsigned int first : 8;
    unsigned int second : 8;
    unsigned int third : 5;
    unsigned int high : 6;
};
extern struct Source data_ov000_021c758c;
extern struct Settings data_ov000_021c7594;
void func_ov000_021af4d8(int a, int b, int c) {
    struct Settings *cfg = &data_ov000_021c7594;
    if (b == data_ov000_021c758c.second &&
        a == cfg->first &&
        cfg->third == c)
        return;
    cfg->first = (unsigned char)a;
    cfg->second = (unsigned char)b;
    cfg->third = (unsigned char)c;
}

